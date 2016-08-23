Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-ua0-f171.google.com ([209.85.217.171]:36828 "EHLO
        mail-ua0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751847AbcHWIiH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Aug 2016 04:38:07 -0400
Received: by mail-ua0-f171.google.com with SMTP id 97so232836232uav.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Aug 2016 01:38:06 -0700 (PDT)
MIME-Version: 1.0
From: Michele Rodolfi <michele.rodolfi@t3lab.it>
Date: Tue, 23 Aug 2016 10:33:03 +0200
Message-ID: <CAHXzriE=-H_1zzBjGKtuthTebk_zfOuOABopCBiEvgo1wWPbrQ@mail.gmail.com>
Subject: Implementation of a socket-based IPC over rpmsg
Content-Type: text/plain; charset=UTF-8
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org
Cc: Alessio Paccoia <alessio.paccoia@t3lab.it>, Matteo Sartori <matteo.sartori@t3lab.it>, Claudio Salati <claudio.salati@t3lab.it>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi all,
I'm implementing an IPC service using the remoteproc/rpmsg framework.
The IPC is intended to be used between threads running on different processors.
The way I want to provide the IPC service to user threads is via socket APIs.

As the rpmsg-ti socket implementation does, I registered the address
familiy AF_RPMSG (and PF_RMPSG) to be used with this socket. The
address format is "rproc_id:port_num", where rproc_id is the remote
processor identifier statically defined in the DT, port_num is an
integer acting as TCP/UDP port numbers (this is _not_ the rpmsg
endpoint).

All the IPC messages between master and a specific remote are
transported using an unique rpmsg channel whose id is "rpmsg-proto".
This socket system supports only one rpmsg channel of type
"rpmsg-proto" per rproc.

The rpmsg socket layer provides a transport protocol that allows
message multiplexing/demultiplexing. Basically it adds a header to the
message payload that contains source and destination port numbers
(like UDP header).

User threads can create and use a rpmsg socket by means of the usual
socket APIs: bind, connect, sendto, recvfrom.

Rpmsg socket type can be either SOCK_DGRAM or SOCK_SEQPACKET. The
basic difference is that the former discards the new packets when the
vring buffer is full, while the latter blocks the send on the source
side until the receiver frees a vring slot.

In order to provide the remoteprocs with static addresses I'm
currently using aliases in the device tree. Alias format is "rproc%d"
where %d is the alias ID, used as rproc address. However, I've noticed
you added a rproc OF look-up function to obtain a rproc reference
ginven an index. I think in theory that this index can be used as
rproc address, but I have not seen any code using this function nor
documentation explaining the "rprocs" phandle usage. Despite that I'd
like to use the "rprocs" list instead of aliases, in order to maintain
everything aligned, but I'm not actually sure this works as I have
understood.

The next step is the preparation of a patchset, but meanwhile I'd like
to discuss this ideas with you, also considering that I'm new to
kernel development.

Best regards,
Michele
