Return-Path: <jslaby@suse.cz>
Subject: Re: [PATCH v7 2/2] tty: add rpmsg driver
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-3-arnaud.pouliquen@st.com>
 <e458f805-c746-c88e-98f4-d874a7552933@suse.cz>
 <1e4ce821-dd9b-bb04-774b-58a255834cf5@st.com>
 <ec061c30-eace-1df9-fa7b-71a61e5710a2@suse.cz>
 <f97d9dc54178e4344512bc7986265f101f4639c6.camel@perches.com>
From: Jiri Slaby <jslaby@suse.cz>
Message-ID: <a06f559c-3507-210c-d743-765163900935@suse.cz>
Date: Thu, 26 Mar 2020 07:38:29 +0100
MIME-Version: 1.0
In-Reply-To: <f97d9dc54178e4344512bc7986265f101f4639c6.camel@perches.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-stm32@st-md-mailman.stormreply.com, xiang xiao <xiaoxiang781216@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 26. 03. 20, 1:01, Joe Perches wrote:
> On Wed, 2020-03-25 at 14:31 +0100, Jiri Slaby wrote:
>> The question was exactly about that: can a compiler optimize it to a
>> bare number or will strlen call remain there?
> 
> $ cat str.c
> #include <string.h>
> 
> int foo(void)
> {
> 	return strlen("abc");
> }
> 
> $ gcc -c -O2 str.c
> $ objdump -d str.o
> str.o:     file format elf64-x86-64
> 
> 
> Disassembly of section .text:
> 
> 0000000000000000 <foo>:
>    0:	f3 0f 1e fa          	endbr64 
>    4:	b8 03 00 00 00       	mov    $0x3,%eax
>    9:	c3                   	retq   

Perfect, but:
* that is userspace (different strlen).
* what about other archs -- AFAIR, i386 implements strlen in asm in the
kernel

Maybe compilers use intrinsics and only after optimizations, they put a
call to strlen?

/me digging

Yeah, even gimple already contains:
  int D.2094;

  D.2094 = 3;
  return D.2094;


That means, even -O0 should generate 3 instead of the call:
$ echo -e '#include <string.h>\nint f() { return strlen("abc"); }' | gcc
-S -x c - -o - -O0
...
f:
.LFB0:
        .cfi_startproc
        pushq   %rbp
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        movq    %rsp, %rbp
        .cfi_def_cfa_register 6
        movl    $3, %eax
        popq    %rbp
        .cfi_def_cfa 7, 8
        ret
        .cfi_endproc


So fine, use strlen :).

thanks,
-- 
js
suse labs
