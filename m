Return-Path: <michele.rodolfi@t3lab.it>
Return-Path: <michele.rodolfi@t3lab.it>
Date: Fri, 26 Aug 2016 13:28:34 +0200
From: Michele Rodolfi <michele.rodolfi@t3lab.it>
Subject: [PATCH 0/2] Socket based IPC over RPMSG for user threads
Message-ID: <cover.1472209108.git.michele.rodolfi@t3lab.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: matteo.sartori@t3lab.it, alessio.paccoia@t3lab.it, claudio.salati@t3lab.it, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi all,
This patch implements an IPC service using the remoteproc/rpmsg framework.
The IPC is intended to be used between threads running on different processors.
The IPC service is provided to user threads via socket APIs.

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
For now I decided to use DT aliases as the TI code does.

This patch wants to incentive a discussion about socket IPC over rpmsg, 
that is _not_ the exposition of the rpmsg bus to userspace.

Best regards,
Michele

Michele Rodolfi (2):
  rpmsg: support for retreiving processor ID from a rpmsg_channel
  net/rpmsg: add support for socket based IPC over rpmsg

 drivers/remoteproc/remoteproc_core.c   |  21 +
 drivers/remoteproc/remoteproc_virtio.c |  21 +
 drivers/rpmsg/virtio_rpmsg_bus.c       |  20 +
 include/linux/remoteproc.h             |   2 +
 include/linux/rpmsg.h                  |   1 +
 include/linux/socket.h                 |   5 +-
 include/uapi/linux/rpmsg_socket.h      |  48 ++
 net/Kconfig                            |   1 +
 net/Makefile                           |   1 +
 net/rpmsg/Kconfig                      |  10 +
 net/rpmsg/Makefile                     |   1 +
 net/rpmsg/rpmsg_proto.c                | 847 +++++++++++++++++++++++++++++++++
 12 files changed, 976 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/linux/rpmsg_socket.h
 create mode 100644 net/rpmsg/Kconfig
 create mode 100644 net/rpmsg/Makefile
 create mode 100644 net/rpmsg/rpmsg_proto.c

-- 
2.7.4
