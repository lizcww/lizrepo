; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
    include \masm32\include\masm32rt.inc
; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤

    ; -------------------------------------------
    ; Build this DLL with the provided MAKEIT.BAT
    ; -------------------------------------------

      .data?
        hInstance dd ?

      .code

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

LibMain proc instance:DWORD,reason:DWORD,unused:DWORD 

    .if reason == DLL_PROCESS_ATTACH
      mrm hInstance, instance       ; copy local to global
      mov eax, TRUE                 ; return TRUE so DLL will start

    .elseif reason == DLL_PROCESS_DETACH

    .elseif reason == DLL_THREAD_ATTACH

    .elseif reason == DLL_THREAD_DETACH

    .endif

    ret

LibMain endp

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

  comment * -----------------------------------------------------
          You should add the procedures your DLL requires AFTER
          the LibMain procedure. For each procedure that you
          wish to EXPORT you must place its name in the "hookDLL.def"
          file so that the linker will know which procedures to
          put in the EXPORT table in the DLL. Use the following
          syntax AFTER the LIBRARY name on the 1st line.
          LIBRARY hookDLL
          EXPORTS YourProcName
          EXPORTS AnotherProcName
          ------------------------------------------------------- *

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

end LibMain
