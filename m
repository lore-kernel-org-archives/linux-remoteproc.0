Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-qt0-f174.google.com ([209.85.216.174]:41319 "EHLO
        mail-qt0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbeHWEzW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Aug 2018 00:55:22 -0400
Received: by mail-qt0-f174.google.com with SMTP id t39-v6so3716782qtc.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Aug 2018 18:28:10 -0700 (PDT)
MIME-Version: 1.0
Reply-To: dry@embedded-synergy.co.za
In-Reply-To: <4941e366-f41f-9b8f-8c23-b840a01b3970@ti.com>
References: <CABViPYkb+g9GkJNVU6AUpzJRwLwZSD9PuxzDrDzgzb6Z0Ky1Gw@mail.gmail.com>
 <4941e366-f41f-9b8f-8c23-b840a01b3970@ti.com>
From: Denis Ryndine <dry@embedded-synergy.co.za>
Date: Thu, 23 Aug 2018 11:28:08 +1000
Message-ID: <CABViPYmZH6dVYH7V9kOTi6KJeoFt1axOzVq6NSrASsFPJsg0eg@mail.gmail.com>
Subject: Re: rproc_elf_load_segments: rproc_elf_load_segments elf loading problem
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
To: Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello Suman,

On Thu, Aug 23, 2018 at 6:50 AM, Suman Anna <s-anna@ti.com> wrote:
>
> Hi Denis,
>
> On 08/20/2018 12:40 AM, Denis Ryndine wrote:
> > Hello,
> >
> > The following may look like an error, could someone review.
> >
> > In rproc_elf_load_segments:
> >
> > /* grab the kernel address for this device address */
> > ptr = rproc_da_to_va(rproc, da, memsz);
> >
> > The last parameter should be filesz. Otherwise this call may fail, as
> > the case when da is an address within a segment / memory.
> > (E.g.  placing a RO data after the code within text segment /memory ).
>
> No, it's alright, memsz >= filesz usually. The actual loadable content

No issue here.

> will be filesz, the rest is zero initialized. Both these are from the
> program headers. Have you seen some issues around this?

If the da points to the beginning of the segment or the device's
memory then it's all good. But da can point somewhere with-in or at
the end of the previous memory segment, where there is enough room to
fit filesz.
The check above may fail using memsz  (memsz >= filesz) if there isn't
physical memory left to fit memsz, but for  >= filesz.

Consider an OCRAM linked firmware (for iMX),  with elf :

Program Headers:
Type Offset VirtAddr PhysAddr FileSiz MemSiz Flg Align
LOAD 0x001000 0x00000000 0x00000000 0x00240 0x00240 R 0x1000
LOAD 0x002000 0x00910000 0x00910000 0x0c2e0 0x0c2e0 RWE 0x1000
LOAD 0x00f000 0x20220000 0x0091c2e0 0x00210 0x072e0 RW 0x1000

The grab kernel address fails trying grab too much:
remoteproc remoteproc0: bad phdr da 0x91c2e0 mem 0x72e0

But it shouldn't, as there is enough space in that memory for the
filesz, which is what to be programmed into it, not the memsz.

For iMX, for example, the device specific  rproc_da_to_va() would have
resolved the needed kernel address, if filesz would have been passed.
See imx_rproc.c - imx_rproc_da_to_va() ->  imx_rproc_da_to_sys(),
which would return the needed address: there is enough in that memory
block for filesz, but not for memsz.


> regards
> Suman

Regards,

Denis
