Return-Path: <michele.rodolfi@t3lab.it>
Return-Path: <michele.rodolfi@t3lab.it>
Date: Fri, 26 Aug 2016 13:29:19 +0200
From: Michele Rodolfi <michele.rodolfi@t3lab.it>
Subject: [PATCH 2/2] net/rpmsg: add support for socket based IPC over rpmsg
Message-ID: <68363202c060a45eb586ac0f45d4af3992009a05.1472209108.git.michele.rodolfi@t3lab.it>
References: <cover.1472209108.git.michele.rodolfi@t3lab.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1472209108.git.michele.rodolfi@t3lab.it>
To: matteo.sartori@t3lab.it, alessio.paccoia@t3lab.it, claudio.salati@t3lab.it, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch add support for a new socket address and protocol
family: AF_RPMSG. The rpmsg socket driver implements a new
transport protocol in order to provide user threads with IPC.

This patch is created from the code in TI repository:
http://git.ti.com/rpmsg/remoteproc branch rpmsg-ti-linux-4.4.y

Signed-off-by: Michele Rodolfi <michele.rodolfi@t3lab.it>
---
 include/linux/socket.h            |   5 +-
 include/uapi/linux/rpmsg_socket.h |  48 +++
 net/Kconfig                       |   1 +
 net/Makefile                      |   1 +
 net/rpmsg/Kconfig                 |  10 +
 net/rpmsg/Makefile                |   1 +
 net/rpmsg/rpmsg_proto.c           | 847 ++++++++++++++++++++++++++++++++++++++
 7 files changed, 911 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/linux/rpmsg_socket.h
 create mode 100644 net/rpmsg/Kconfig
 create mode 100644 net/rpmsg/Makefile
 create mode 100644 net/rpmsg/rpmsg_proto.c

diff --git a/include/linux/socket.h b/include/linux/socket.h
index b5cc5a6..30f865c 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -202,8 +202,8 @@ struct ucred {
 #define AF_VSOCK	40	/* vSockets			*/
 #define AF_KCM		41	/* Kernel Connection Multiplexor*/
 #define AF_QIPCRTR	42	/* Qualcomm IPC Router          */
-
-#define AF_MAX		43	/* For now.. */
+#define AF_RPMSG	43	/* Rpmsg sockets		*/
+#define AF_MAX		44	/* For now.. */
 
 /* Protocol families, same as address families. */
 #define PF_UNSPEC	AF_UNSPEC
@@ -251,6 +251,7 @@ struct ucred {
 #define PF_VSOCK	AF_VSOCK
 #define PF_KCM		AF_KCM
 #define PF_QIPCRTR	AF_QIPCRTR
+#define PF_RPMSG	AF_RPMSG
 #define PF_MAX		AF_MAX
 
 /* Maximum queue length specifiable by listen.  */
diff --git a/include/uapi/linux/rpmsg_socket.h b/include/uapi/linux/rpmsg_socket.h
new file mode 100644
index 0000000..47b4370
--- /dev/null
+++ b/include/uapi/linux/rpmsg_socket.h
@@ -0,0 +1,48 @@
+/*
+ * Remote processor messaging sockets
+ *
+ * Copyright (C) 2011-2016 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Ohad Ben-Cohen <ohad@wizery.com>
+ * Suman Anna <s-anna@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _UAPI_RPMSG_SOCKET_H
+#define _UAPI_RPMSG_SOCKET_H
+
+#include <linux/types.h>
+#include <linux/socket.h>
+
+/*
+ * user space needs this as well as rpmsg_proto.c within the kernel
+ * XXX not sure if this is the right way to expose AF_RPMSG to userspace.
+ */
+#ifndef AF_RPMSG
+#define AF_RPMSG	43 /* MUST match value in include/linux/socket.h */
+#define PF_RPMSG	AF_RPMSG
+#endif
+
+/**
+ * struct sockaddr_rpmsg - structure describing a Rpmsg socket address
+ * @family - socket address family (AF_RPMSG)
+ * @vproc_id - remote processor identifier (remote address)
+ * @port - port number (16 bits as in TCP/UDP)
+ */
+struct sockaddr_rpmsg {
+	__kernel_sa_family_t family;
+	__u32 vproc_id;
+	__u16 port;
+};
+
+#define RPMSG_LOCALHOST ((__u32)~0UL)
+
+#endif /* _UAPI_RPMSG_SOCKET_H */
diff --git a/net/Kconfig b/net/Kconfig
index c2cdbce..d410099 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -392,6 +392,7 @@ source "net/9p/Kconfig"
 source "net/caif/Kconfig"
 source "net/ceph/Kconfig"
 source "net/nfc/Kconfig"
+source "net/rpmsg/Kconfig"
 
 config LWTUNNEL
 	bool "Network light weight tunnels"
diff --git a/net/Makefile b/net/Makefile
index 9bd20bb..5dceaa4 100644
--- a/net/Makefile
+++ b/net/Makefile
@@ -80,3 +80,4 @@ obj-y				+= l3mdev/
 endif
 obj-$(CONFIG_QRTR)		+= qrtr/
 obj-$(CONFIG_NET_NCSI)		+= ncsi/
+obj-$(CONFIG_RPMSG_PROTO) 	+= rpmsg/
diff --git a/net/rpmsg/Kconfig b/net/rpmsg/Kconfig
new file mode 100644
index 0000000..beec697
--- /dev/null
+++ b/net/rpmsg/Kconfig
@@ -0,0 +1,10 @@
+#
+# Rpmsg proto socket
+#
+
+config RPMSG_PROTO
+	tristate "Rpmsg Socket protocol"
+	select REMOTEPROC
+	select RPMSG
+	help
+	  API socket for rpmsg communications
diff --git a/net/rpmsg/Makefile b/net/rpmsg/Makefile
new file mode 100644
index 0000000..44e11fd
--- /dev/null
+++ b/net/rpmsg/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_RPMSG_PROTO)	+= rpmsg_proto.o
diff --git a/net/rpmsg/rpmsg_proto.c b/net/rpmsg/rpmsg_proto.c
new file mode 100644
index 0000000..499a213
--- /dev/null
+++ b/net/rpmsg/rpmsg_proto.c
@@ -0,0 +1,847 @@
+/*
+ * AF_RPMSG: Remote processor messaging sockets
+ *
+ * Copyright (C) 2011-2016 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Ohad Ben-Cohen <ohad@wizery.com>
+ * Robert Tivy <rtivy@ti.com>
+ * G Anthony <a0783926@ti.com>
+ * Suman Anna <s-anna@ti.com>
+ * Michele Rodolfi <michele.rodolfi@t3lab.it>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#define pr_fmt(fmt)    "%s: " fmt, __func__
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/types.h>
+#include <linux/list.h>
+#include <linux/errno.h>
+#include <linux/skbuff.h>
+#include <linux/err.h>
+#include <linux/mutex.h>
+#include <linux/rpmsg.h>
+#include <linux/radix-tree.h>
+#include <linux/remoteproc.h>
+#include <net/sock.h>
+#include <uapi/linux/rpmsg_socket.h>
+
+/* This is the channel id that identifies the rpmsg socket IPC */
+#define RPMSG_PROTO_CHANNEL_ID "rpmsg-proto"
+
+/* Macro helping to set/get source address while receiving a packet */
+#define RPMSG_CB(skb)	(*(struct sockaddr_rpmsg *)&((skb)->cb))
+
+/* Separation between well-known ports and ephemeral ports. */
+#define RPMSG_SOCK_RESERVED_PORTS     (1024)
+
+/* Maximum buffer size supported by virtio rpmsg transport.
+ * Must match value as in drivers/rpmsg/virtio_rpmsg_bus.c
+ */
+#define RPMSG_BUF_SIZE               (512)
+
+/* Rpmsg port is a 16 bit unsigned value */
+#define RPMSG_MAX_SOCK (256 * 256)
+#define RPMG_INIT_MSG "init_msg"
+
+/* struct rmpsg_socket - representation of RPMSG sockets
+ * @sk - ancestor class
+ * @rpdev - pointer to rpmsg device providing communication
+ * @rproc_id - remote processor identifier
+ * @local_port - local rpmsg port
+ * @remote_port - remote rpmsg port
+ * @elem - list element within channel socket list
+ * @cb_block_flag - wait queue condition
+ * @cb_wait_queue - provide blocking for userspace send
+ * @sync_lock - for concurrent manipulation of cb_block_flag
+ */
+struct rpmsg_socket {
+	struct sock sk;
+	struct rpmsg_channel *rpdev; /* valid if socket is connected */
+	int rproc_id;                /* valid if socket is connected */
+	int local_port;
+	int remote_port;             /* valid if socket is connected */
+	struct list_head elem;
+	int cb_block_flag;
+	wait_queue_head_t cb_wait_q;
+	struct mutex sync_lock;	/* concurrent manipulation of cb_block_flag */
+};
+
+/* Connection and socket states */
+enum {
+	RPMSG_CONNECTED = 1,
+	RPMSG_OPEN,
+	RPMSG_LISTENING,
+	RPMSG_CLOSED,
+	RPMSG_ERROR,
+};
+
+/* struct rpmsg_proto_header - header of RPMSG IPC protocol
+ * @src - source port
+ * @dst - destination port
+ */
+struct rpmsg_proto_hdr {
+	__u16 src;
+	__u16 dst;
+};
+
+#define RPMSG_PROTO_HDR_SIZE sizeof(struct rpmsg_proto_hdr)
+
+/* A radix-tree-based scheme is used to maintain the rpmsg channels
+ * we're using. This radix tree maps vproc index id to its channels.
+ * Currently only one channel per vproc is supported.
+ */
+static RADIX_TREE(rpmsg_channels, GFP_KERNEL);
+
+/* Synchronization of access to the tree is achieved using a mutex,
+ * because we're using non-atomic radix tree allocations.
+ */
+static DEFINE_MUTEX(rpmsg_channels_lock);
+
+static struct proto rpmsg_proto = {
+	.name		= "RPMSG",
+	.owner		= THIS_MODULE,
+	.obj_size = sizeof(struct rpmsg_socket),
+};
+
+/* Structs and functions for managing socket addresses (rpmsg ports) */
+static RADIX_TREE(rpmsg_socks, GFP_KERNEL);
+static DEFINE_MUTEX(rpmsg_socks_lock);
+
+/* Get the rpmsg_socket bound to port
+ * returns the rpmsg_socket pointer or NULL in case of error
+ */
+static struct rpmsg_socket *rpmsg_sock_lookup_get(int port)
+{
+	struct rpmsg_socket *ret;
+
+	if (port < 0 || port >= RPMSG_MAX_SOCK)
+		return NULL;
+	mutex_lock(&rpmsg_socks_lock);
+	ret = radix_tree_lookup(&rpmsg_socks, port);
+	mutex_unlock(&rpmsg_socks_lock);
+	return ret;
+}
+
+/* Bind sock to port.
+ * If port is 0, this function tries to bind sock to the first available port.
+ * Returns the bound port or an appropriate error value
+ */
+static int rpmsg_sock_lookup_set(int port, struct rpmsg_socket *rpsk)
+{
+	int i, ret;
+
+	if (!rpsk)
+		return -EINVAL;
+	if (port >= RPMSG_MAX_SOCK || port < 0)
+		return -EINVAL;
+	mutex_lock(&rpmsg_socks_lock);
+	if (port > 0) {
+		ret = radix_tree_insert(&rpmsg_socks, port, rpsk);
+		if (ret < 0) {
+			if (ret == -EEXIST)
+				ret = -EADDRINUSE;
+		} else {
+			ret = port;
+		}
+		goto out;
+	} else {
+		/* port == 0: request for the first available port
+		 *  (starting from RPMSG_SOCK_RESERVED_PORTS)
+		 */
+		for (i = RPMSG_SOCK_RESERVED_PORTS; i < RPMSG_MAX_SOCK; i++) {
+			if (radix_tree_insert(&rpmsg_socks, i, rpsk) == 0) {
+				ret = i;
+				goto out;
+			}
+		}
+		/* no available ports */
+		ret = -EADDRINUSE;
+	}
+out:
+	mutex_unlock(&rpmsg_socks_lock);
+	return ret;
+}
+
+/* Delete the port - sock binding from the lookup table.
+ * Returns 0 if success or EINVAL in case of error
+ */
+static int rpmsg_sock_lookup_release(int port)
+{
+	if (port < 0 || port >= RPMSG_MAX_SOCK)
+		return -EINVAL;
+	mutex_lock(&rpmsg_socks_lock);
+	radix_tree_delete(&rpmsg_socks, port);
+	mutex_unlock(&rpmsg_socks_lock);
+	return 0;
+}
+
+/* Retrieve the rproc instance so that it can be used for retrieving
+ * the processor id associated with the rpmsg channel.
+ */
+static struct rproc *rpdev_to_rproc(struct rpmsg_channel *rpdev)
+{
+	struct virtio_device *vdev;
+
+	vdev = rpmsg_get_virtio_dev(rpdev);
+	if (!vdev)
+		return NULL;
+	return rproc_vdev_to_rproc_safe(vdev);
+}
+
+/* Retrieve the rproc id. The rproc id _relies_ on aliases being defined
+ * in the DT blob for each of the remoteproc devices, and is essentially
+ * the alias id. These are assumed to match to be fixed for a particular
+ * SoC, and this provides a means to have a fixed interface to identify
+ * a remote processor.
+ */
+static int rpmsg_sock_get_proc_id(struct rpmsg_channel *rpdev)
+{
+	struct rproc *rproc = rpdev_to_rproc(rpdev);
+	int id;
+
+	if (!rproc) {
+		WARN_ON(1);
+		return -EINVAL;
+	}
+	id = rproc_get_alias_id(rproc);
+	dev_dbg(&rpdev->dev, "%s: id = %d\n", __func__, id);
+	WARN_ON(id < 0);
+
+	return id;
+}
+
+static int rpmsg_sock_connect(struct socket *sock, struct sockaddr *addr,
+			      int alen, int flags)
+{
+	struct sock *sk = sock->sk;
+	struct rpmsg_socket *rpsk;
+	struct sockaddr_rpmsg *sa;
+	int ret = 0;
+	struct rpmsg_channel *rpdev;
+	struct list_head *sock_list;
+
+	if (sk->sk_type == SOCK_DGRAM && addr->sa_family == AF_UNSPEC) {
+		sk->sk_state = RPMSG_OPEN;
+		return 0;
+	}
+
+	if (sk->sk_state == RPMSG_CLOSED)
+		return -EBADFD;
+
+	if (sk->sk_type != SOCK_DGRAM && sk->sk_type != SOCK_SEQPACKET) {
+		pr_err("%s error: invalid sock type\n", __func__);
+		return -EINVAL;
+	}
+	if (!addr || addr->sa_family != AF_RPMSG)
+		return -EINVAL;
+
+	if (alen < sizeof(*sa)) {
+		pr_err("%s error: invalid sockaddr len\n", __func__);
+		return -EINVAL;
+	}
+	sa = (struct sockaddr_rpmsg *)addr;
+
+	mutex_lock(&rpmsg_channels_lock);
+
+	lock_sock(sk);
+
+	rpsk = container_of(sk, struct rpmsg_socket, sk);
+
+	/* find the channel exposed by this remote processor */
+	rpdev = radix_tree_lookup(&rpmsg_channels, sa->vproc_id);
+	if (!rpdev) {
+		pr_err("%s error: cannot find channel for proc id:%d\n",
+		       __func__, sa->vproc_id);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	rpsk->remote_port = sa->port;
+	rpsk->rproc_id = sa->vproc_id;
+	rpsk->rpdev = rpdev;
+
+	/* implicit dynamic bind */
+	if (rpsk->local_port < 0) {
+		/* bind this socket to a port number */
+		ret = rpmsg_sock_lookup_set(0, rpsk);
+		if (ret <= 0) {
+			pr_err("%s: cannot bind socket. Err: %d\n",
+			       __func__, ret);
+			goto out;
+		}
+		rpsk->local_port = ret;
+	}
+	sk->sk_state = RPMSG_CONNECTED;
+
+	/* Insert sock into channel socket list */
+	sock_list = rpsk->rpdev->ept->priv;
+	list_add(&rpsk->elem, sock_list);
+
+out:
+	release_sock(sk);
+	mutex_unlock(&rpmsg_channels_lock);
+	return ret;
+}
+
+static int rpmsg_sock_sendmsg(struct socket *sock, struct msghdr *msg,
+			      size_t len)
+{
+	struct sock *sk = sock->sk;
+	struct rpmsg_socket *rpsk;
+	struct rpmsg_proto_hdr hdr;
+	struct sockaddr_rpmsg *dest;
+	struct rpmsg_channel *channel;
+	char payload[RPMSG_BUF_SIZE];
+	int ret;
+
+	/* XXX check for sock_error as well ? */
+	/* XXX handle noblock ? */
+	if (msg->msg_flags & MSG_OOB)
+		return -EOPNOTSUPP;
+
+	/* no payload ? */
+	if (!msg->msg_iter.iov->iov_base)
+		return -EINVAL;
+
+	/* make sure the length is valid for copying into kernel buffer */
+	if (len > RPMSG_BUF_SIZE - sizeof(struct rpmsg_hdr) -
+			RPMSG_PROTO_HDR_SIZE)
+		return -EMSGSIZE;
+
+	lock_sock(sk);
+
+	/* we don't support Tx on errored-out sockets */
+	if (sk->sk_state == RPMSG_ERROR) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+
+	rpsk = container_of(sk, struct rpmsg_socket, sk);
+	hdr.src = rpsk->local_port;
+	if (sk->sk_state != RPMSG_CONNECTED) {
+		dest = (struct sockaddr_rpmsg *)msg->msg_name;
+		hdr.dst = dest->port;
+		/* find channel given the rproc id */
+		channel = radix_tree_lookup(&rpmsg_channels, dest->vproc_id);
+		if (!channel) {
+			pr_err("%s error: cannot find channel for proc id:%d\n",
+			       __func__, dest->vproc_id);
+			ret = -EINVAL;
+			goto out;
+		}
+	} else {
+		hdr.dst = rpsk->remote_port;
+		channel = rpsk->rpdev;
+	}
+	memcpy(payload, &hdr, RPMSG_PROTO_HDR_SIZE);
+	memcpy_from_msg(payload + RPMSG_PROTO_HDR_SIZE, msg, len);
+	ret = rpmsg_send(channel, payload, len + RPMSG_PROTO_HDR_SIZE);
+	if (ret)
+		pr_err("rpmsg_send failed: %d\n", ret);
+	else
+		ret = len;
+
+out:
+	release_sock(sk);
+	return ret;
+}
+
+static int rpmsg_sock_recvmsg(struct socket *sock, struct msghdr *msg,
+			      size_t len, int flags)
+{
+	struct sock *sk = sock->sk;
+	struct rpmsg_socket *rpsk = container_of(sk, struct rpmsg_socket, sk);
+	struct sockaddr_rpmsg *sa;
+	struct sk_buff *skb;
+	int ret;
+
+	if (flags & MSG_OOB) {
+		pr_err("MSG_OOB: %d\n", EOPNOTSUPP);
+		return -EOPNOTSUPP;
+	}
+
+	/* return failure on errored-out Rx sockets */
+	lock_sock(sk);
+	if (sk->sk_state == RPMSG_ERROR) {
+		release_sock(sk);
+		return -ENOLINK;
+	}
+	release_sock(sk);
+
+	msg->msg_namelen = 0;
+
+	skb = skb_recv_datagram(sk, flags, 0, &ret);
+	if (!skb) {
+		/* check for shutdown ? */
+		pr_err("skb_recv_datagram: %d\n", ret);
+		return ret;
+	}
+
+	if (msg->msg_name) {
+		msg->msg_namelen = sizeof(*sa);
+		sa = (struct sockaddr_rpmsg *)msg->msg_name;
+		sa->vproc_id = RPMSG_CB(skb).vproc_id;
+		sa->port = RPMSG_CB(skb).port;
+		sa->family = AF_RPMSG;
+	}
+
+	if (len > skb->len) {
+		len = skb->len;
+	} else if (len < skb->len) {
+		pr_warn("user buffer is too small\n");
+		/* XXX truncate or error ? */
+		msg->msg_flags |= MSG_TRUNC;
+	}
+
+	ret = skb_copy_datagram_msg(skb, 0, msg, len);
+	if (ret) {
+		pr_err("error copying skb data: %d\n", ret);
+		goto out_free;
+	}
+
+	ret = len;
+
+out_free:
+	skb_free_datagram(sk, skb);
+	if (sk->sk_type == SOCK_SEQPACKET) {
+		while (mutex_lock_interruptible(&rpsk->sync_lock))
+			;
+		rpsk->cb_block_flag = 1;
+		mutex_unlock(&rpsk->sync_lock);
+		wake_up_interruptible(&rpsk->cb_wait_q);
+	}
+	return ret;
+}
+
+/* return bound socket address information, either local or remote
+ * note: len is just an output parameter, doesn't carry any input value
+ */
+static int rpmsg_sock_getname(struct socket *sock, struct sockaddr *addr,
+			      int *len, int peer)
+{
+	struct sock *sk = sock->sk;
+	struct rpmsg_socket *rpsk;
+	struct rpmsg_channel *rpdev;
+	struct sockaddr_rpmsg *sa;
+
+	rpsk = container_of(sk, struct rpmsg_socket, sk);
+	rpdev = rpsk->rpdev;
+
+	if (!rpdev && peer)
+		return -ENOTCONN;
+
+	addr->sa_family = AF_RPMSG;
+
+	sa = (struct sockaddr_rpmsg *)addr;
+
+	*len = sizeof(*sa);
+
+	if (peer) {
+		sa->vproc_id = rpsk->rproc_id;
+		sa->port = rpsk->remote_port;
+	} else {
+		sa->vproc_id = RPMSG_LOCALHOST;
+		sa->port = rpsk->local_port;
+	}
+
+	return 0;
+}
+
+static int rpmsg_sock_release(struct socket *sock)
+{
+	struct sock *sk = sock->sk;
+	struct rpmsg_socket *rpsk = container_of(sk, struct rpmsg_socket, sk);
+
+	if (!sk)
+		return 0;
+
+	if (rpsk->local_port > 0) {
+		/* need to unbind the socket */
+		rpmsg_sock_lookup_release(rpsk->local_port);
+	}
+	sock_put(sock->sk);
+	return 0;
+}
+
+/* Bind the socket to a local port. uaddr->vproc_id is supposed to be the
+ * local processor id and it is ignored as we only bind sockets to the local
+ * processor.
+ * If uaddr->addr is 0, then it tries to bind the socket to the first free
+ * port greater than RPMSG_SOCK_RESERVED_PORTS
+ * Returns 0 on success or an appropriate negative error value on failure.
+ */
+static int
+rpmsg_sock_bind(struct socket *sock, struct sockaddr *uaddr, int addr_len)
+{
+	struct sock *sk = sock->sk;
+	struct rpmsg_socket *rpsk = container_of(sk, struct rpmsg_socket, sk);
+	struct sockaddr_rpmsg *sa = (struct sockaddr_rpmsg *)uaddr;
+	int ret;
+
+	if (sock->state == SS_CONNECTED)
+		return -EINVAL;
+
+	if (addr_len != sizeof(*sa))
+		return -EINVAL;
+
+	if (sa->family != AF_RPMSG)
+		return -EINVAL;
+
+	if (rpsk->rpdev)
+		return -EBUSY;
+
+	if (sk->sk_state != RPMSG_OPEN)
+		return -EINVAL;
+
+	pr_debug("%s sockaddr: %d %d\n", __func__, sa->vproc_id, sa->port);
+
+	rpsk->rpdev = NULL;
+	rpsk->rproc_id = -1;
+
+	/* bind this socket with its port number */
+	ret = rpmsg_sock_lookup_set((int)sa->port, rpsk);
+	if (ret <= 0) {
+		pr_debug("%s: cannot bind socket to addr %d\n",
+			 __func__, sa->port);
+		return ret;
+	}
+	rpsk->local_port = ret;
+	rpsk->remote_port = -1;
+	sk->sk_state = RPMSG_LISTENING;
+	pr_debug("%s: socket bound to %d\n", __func__, rpsk->local_port);
+
+	return 0;
+}
+
+static const struct proto_ops rpmsg_sock_ops = {
+	.family		= PF_RPMSG,
+	.owner		= THIS_MODULE,
+
+	.release	= rpmsg_sock_release,
+	.connect	= rpmsg_sock_connect,
+	.getname	= rpmsg_sock_getname,
+	.sendmsg	= rpmsg_sock_sendmsg,
+	.recvmsg	= rpmsg_sock_recvmsg,
+	.bind		= rpmsg_sock_bind,
+
+	.poll		= sock_no_poll,
+	.listen		= sock_no_listen,
+	.accept		= sock_no_accept,
+	.ioctl		= sock_no_ioctl,
+	.mmap		= sock_no_mmap,
+	.socketpair	= sock_no_socketpair,
+	.shutdown	= sock_no_shutdown,
+	.setsockopt	= sock_no_setsockopt,
+	.getsockopt	= sock_no_getsockopt
+};
+
+static void rpmsg_sock_destruct(struct sock *sk)
+{
+	struct rpmsg_socket *rpsk = (struct rpmsg_socket *)sk;
+
+	/* remove sock from channel socket list */
+	list_del(&rpsk->elem);
+}
+
+static int rpmsg_sock_create(struct net *net, struct socket *sock, int proto,
+			     int kern)
+{
+	struct sock *sk;
+	struct rpmsg_socket *rpsk;
+
+	if (sock->type != SOCK_DGRAM && sock->type != SOCK_SEQPACKET)
+		return -ESOCKTNOSUPPORT;
+	if (proto != 0)
+		return -EPROTONOSUPPORT;
+	sk = sk_alloc(net, PF_RPMSG, GFP_KERNEL, &rpmsg_proto, kern);
+	if (!sk)
+		return -ENOMEM;
+
+	sock->state = SS_UNCONNECTED;
+	sock->ops = &rpmsg_sock_ops;
+	sock_init_data(sock, sk);
+
+	sk->sk_destruct = rpmsg_sock_destruct;
+	sk->sk_protocol = proto;
+
+	sk->sk_state = RPMSG_OPEN;
+
+	rpsk = container_of(sk, struct rpmsg_socket, sk);
+	rpsk->local_port = -1;
+	rpsk->remote_port = -1;
+	INIT_LIST_HEAD(&rpsk->elem);
+
+	/* use RPMSG_LOCALHOST to serve as an invalid value */
+	rpsk->rproc_id = RPMSG_LOCALHOST;
+
+	/* Initialize mutex */
+	mutex_init(&rpsk->sync_lock);
+
+	/* Initialize wait queue head that provides blocking rx for userspace */
+	if (sk->sk_type == SOCK_SEQPACKET) {
+		init_waitqueue_head(&rpsk->cb_wait_q);
+		rpsk->cb_block_flag = 0;
+	}
+
+	return 0;
+}
+
+static const struct net_proto_family rpmsg_proto_family = {
+	.family = PF_RPMSG,
+	.create	= rpmsg_sock_create,
+	.owner = THIS_MODULE,
+};
+
+static void __rpmsg_proto_cb(struct rpmsg_channel *rpdev, int from_vproc_id,
+			     void *data, int len, void *priv, u32 src)
+{
+	struct device *dev = &rpdev->dev;
+	struct rpmsg_socket *rpsk;
+	struct sock *sk;
+	struct sk_buff *skb;
+	int ret;
+	struct rpmsg_proto_hdr hdr;
+
+#if defined(CONFIG_DYNAMIC_DEBUG)
+	dynamic_hex_dump("rpmsg_proto Rx: ", DUMP_PREFIX_NONE, 16, 1, data,
+			 len, true);
+#endif
+
+	/* Parse rpmsg_proto header and get the socket from the lookup tree */
+	memcpy(&hdr, data, RPMSG_PROTO_HDR_SIZE);
+	rpsk = rpmsg_sock_lookup_get((int)hdr.dst);
+	if (!rpsk) {
+		dev_warn(dev, "cannot find rpmsg_socket for port %d", hdr.dst);
+		return;
+	}
+	sk = &rpsk->sk;
+	lock_sock(sk);
+	data += RPMSG_PROTO_HDR_SIZE;
+	len -= RPMSG_PROTO_HDR_SIZE;
+	src = hdr.src;
+
+	switch (sk->sk_state) {
+	case RPMSG_CONNECTED:
+		if (rpsk->remote_port != src)
+			//XXX maybe discard packet?
+			dev_warn(dev, "unexpected source address: %d. Expecting %d.\n",
+				 src, rpsk->remote_port);
+		break;
+	case RPMSG_LISTENING:
+		// XXX Maybe perform an implicit connection to the sender node?
+		break;
+	default:
+		dev_warn(dev, "unexpected inbound message (from %d)\n", src);
+		break;
+	}
+
+	skb = alloc_skb(len, sk->sk_allocation);
+	if (!skb)
+		goto out; /* out of memory */
+
+	RPMSG_CB(skb).vproc_id = from_vproc_id;
+	RPMSG_CB(skb).port = src;
+	RPMSG_CB(skb).family = AF_RPMSG;
+
+	memcpy(skb_put(skb, len), data, len);
+	while ((ret = sock_queue_rcv_skb(sk, skb)) == -ENOMEM &&
+	       sk->sk_type == SOCK_SEQPACKET)
+		/* block only if socket type is SOCK_SEQPACKET */
+	{
+		release_sock(sk);
+		/* Block till recv frees space from socket recv buffer */
+		wait_event_interruptible(rpsk->cb_wait_q,
+					 rpsk->cb_block_flag);
+		lock_sock(sk);
+	}
+	if (sk->sk_type == SOCK_SEQPACKET) {
+		while (mutex_lock_interruptible(&rpsk->sync_lock))
+			;
+		rpsk->cb_block_flag = 0;
+		mutex_unlock(&rpsk->sync_lock);
+	}
+	if (ret) {
+		dev_err(dev, "sock_queue_rcv_skb failed: %d\n", ret);
+		kfree_skb(skb);
+	}
+
+out:
+	release_sock(sk);
+}
+
+static void rpmsg_proto_cb(struct rpmsg_channel *rpdev, void *data, int len,
+			   void *priv, u32 src)
+{
+	int id = rpmsg_sock_get_proc_id(rpdev);
+
+	__rpmsg_proto_cb(rpdev, id, data, len, priv, src);
+}
+
+/* every channel we're probed with is exposed to userland via the Socket API */
+static int rpmsg_proto_probe(struct rpmsg_channel *rpdev)
+{
+	struct device *dev = &rpdev->dev;
+	int ret, dst = rpdev->dst, id;
+	struct rpmsg_channel *vrp_channel;
+	struct list_head *sock_list = NULL;
+	char buf[RPMSG_BUF_SIZE];
+
+	dev_dbg(dev, "CALLED %s. Channel %s, from %d to %d\n", __func__,
+		rpdev->id.name, rpdev->src, rpdev->dst);
+
+	if (dst == RPMSG_ADDR_ANY)
+		return 0;
+
+	id = rpmsg_sock_get_proc_id(rpdev);
+	mutex_lock(&rpmsg_channels_lock);
+
+	/* are we exposing the channel for this remote processor yet ? */
+	vrp_channel = radix_tree_lookup(&rpmsg_channels, id);
+	/* not yet ? let's do it */
+	if (!vrp_channel) {
+		ret = radix_tree_insert(&rpmsg_channels, id, rpdev);
+		if (ret) {
+			dev_err(dev, "radix_tree_insert failed: %d\n", ret);
+			goto out;
+		}
+	} else {
+		ret = -ENODEV;
+		dev_err(dev, "multiple rpmsg-proto devices from the same rproc is not supported.\n");
+		goto out;
+	}
+
+	WARN_ON(!!rpdev->ept->priv);
+	sock_list = kzalloc(sizeof(*sock_list), GFP_KERNEL);
+	if (!sock_list) {
+		dev_err(dev, "failed to allocate list_head\n");
+		ret = -ENOMEM;
+		goto out;
+	}
+	INIT_LIST_HEAD(sock_list);
+	rpdev->ept->priv = sock_list;
+
+	/* send init message */
+	sprintf(buf, RPMG_INIT_MSG);
+	ret = rpmsg_sendto(rpdev, buf, sizeof(RPMG_INIT_MSG), rpdev->dst);
+	if (ret) {
+		dev_err(&rpdev->dev, "Failed to send init_msg to target 0x%x.",
+			rpdev->dst);
+		return ret;
+	}
+	dev_info(&rpdev->dev, "Sent init_msg to target 0x%x.", rpdev->dst);
+
+out:
+	mutex_unlock(&rpmsg_channels_lock);
+	return ret;
+}
+
+static void rpmsg_proto_remove(struct rpmsg_channel *rpdev)
+{
+	struct device *dev = &rpdev->dev;
+	int id, dst = rpdev->dst;
+	struct rpmsg_channel *vrp_channel;
+	struct list_head *sk_list;
+	struct rpmsg_socket *rpsk, *tmp;
+
+	if (dst == RPMSG_ADDR_ANY)
+		return;
+
+	id = rpmsg_sock_get_proc_id(rpdev);
+
+	mutex_lock(&rpmsg_channels_lock);
+	vrp_channel = radix_tree_lookup(&rpmsg_channels, id);
+	if (!vrp_channel) {
+		dev_err(dev, "can't find channels for this vrp: %d\n", id);
+		goto out;
+	}
+
+	/* release all sockets that are using this channel */
+	sk_list = rpdev->ept->priv;
+	list_for_each_entry_safe(rpsk, tmp, sk_list, elem) {
+		lock_sock(&rpsk->sk);
+		rpsk->sk.sk_state = RPMSG_ERROR;
+		rpsk->rpdev = NULL;
+		rpsk->sk.sk_error_report(&rpsk->sk);
+		release_sock(&rpsk->sk);
+		list_del(&rpsk->elem);
+	}
+	kfree(sk_list);
+	rpdev->ept->priv = NULL;
+	if (!radix_tree_delete(&rpmsg_channels, id))
+		dev_err(dev, "failed to delete vrp_channels for id %d\n",
+			id);
+	kfree(vrp_channel);
+
+out:
+	mutex_unlock(&rpmsg_channels_lock);
+}
+
+static struct rpmsg_device_id rpmsg_proto_id_table[] = {
+	{ .name	= RPMSG_PROTO_CHANNEL_ID },
+	{ },
+};
+MODULE_DEVICE_TABLE(rpmsg, rpmsg_proto_id_table);
+
+static struct rpmsg_driver rpmsg_proto_driver = {
+	.drv.name	= KBUILD_MODNAME,
+	.id_table	= rpmsg_proto_id_table,
+	.probe		= rpmsg_proto_probe,
+	.callback	= rpmsg_proto_cb,
+	.remove		= rpmsg_proto_remove,
+};
+
+static int __init rpmsg_proto_init(void)
+{
+	int ret;
+
+	ret = proto_register(&rpmsg_proto, 0);
+	if (ret) {
+		pr_err("proto_register failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = sock_register(&rpmsg_proto_family);
+	if (ret) {
+		pr_err("sock_register failed: %d\n", ret);
+		goto proto_unreg;
+	}
+
+	ret = register_rpmsg_driver(&rpmsg_proto_driver);
+	if (ret) {
+		pr_err("register_rpmsg_driver failed: %d\n", ret);
+		goto sock_unreg;
+	}
+
+	return 0;
+
+sock_unreg:
+	sock_unregister(PF_RPMSG);
+proto_unreg:
+	proto_unregister(&rpmsg_proto);
+	return ret;
+}
+
+static void __exit rpmsg_proto_exit(void)
+{
+	unregister_rpmsg_driver(&rpmsg_proto_driver);
+	sock_unregister(PF_RPMSG);
+	proto_unregister(&rpmsg_proto);
+}
+
+module_init(rpmsg_proto_init);
+module_exit(rpmsg_proto_exit);
+
+MODULE_DESCRIPTION("Remote processor messaging protocol");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("rpmsg:rpmsg-proto");
+MODULE_ALIAS_NETPROTO(AF_RPMSG);
-- 
2.7.4
