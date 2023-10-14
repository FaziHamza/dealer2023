import React, { useCallback, useMemo } from "react";
import { Take } from "../../common/game/GameControl";
import { useDispatch, useSelector } from "react-redux";
import { take } from "../../slice/gameStateSlice";
const TakeButton = ({ BetTakeValueRef }) => {
  const dispatch = useDispatch();
  const gameState = useSelector((state) => state.gameState);
  const user = useSelector((state) => state.auth.user);

  const currentIndex = useMemo(
    () => gameState.ActivePlayers.findIndex((x) => x.PlayerId === user.Id),
    [gameState.ActivePlayers, user.Id]
  );

  const TakeEventHandler = useCallback(
    (ev) => {
      try {
        /*
          Get takeamount
          If BetTakeValue is more than 1, take BetTakeValue.
          Else, Take all of Game's Current PotSize.
      */
        const betTakeValule = BetTakeValueRef.current.value;
        const takeamount =
          betTakeValule === "" || betTakeValule === "0"
            ? gameState.PotSize
            : parseFloat(betTakeValule);

        // check if takeamount is between 0 ~ GameHash.Potsize
        if (takeamount > gameState.PotSize || takeamount < 0) {
          alert("Input correct number");
          return;
        } else {
          Take(user.Id, gameState.GameCode, currentIndex, takeamount, () => {
            dispatch(
              take({
                Index: currentIndex,
                Amount: takeamount,
              })
            );
            BetTakeValueRef.current.value = "";
          });
        }
      } catch (err) {}
    },
    [BetTakeValueRef, currentIndex, dispatch, gameState, user.Id]
  );
  if (gameState.PotSize > 0)
    return (
      <button className="btn Take ml-1 mt-1 mr-1" onClick={TakeEventHandler}>
        Take
      </button>
    );
  return <></>;
};

export default TakeButton;
