Return-Path: <mchehab@smtp.s-opensource.com>
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH v2 10/26] rpmsg.txt: standardize document format
Date: Sat, 17 Jun 2017 12:26:50 -0300
Message-Id: <8e196861378451b9bbec0553d7a2f1052e95adc7.1497713221.git.mchehab@s-opensource.com>
In-Reply-To: <1a82f2bf2de4b016964cb71ff92dc3a472044f40.1497713221.git.mchehab@s-opensource.com>
References: <1a82f2bf2de4b016964cb71ff92dc3a472044f40.1497713221.git.mchehab@s-opensource.com>
In-Reply-To: <1a82f2bf2de4b016964cb71ff92dc3a472044f40.1497713221.git.mchehab@s-opensource.com>
References: <1a82f2bf2de4b016964cb71ff92dc3a472044f40.1497713221.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- mark document and chapter titles;
- mark notes;
- mark literal blocks;
- adjust identation.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/rpmsg.txt | 340 ++++++++++++++++++++++++++++--------------------
 1 file changed, 200 insertions(+), 140 deletions(-)

diff --git a/Documentation/rpmsg.txt b/Documentation/rpmsg.txt
index a95e36a43288..24b7a9e1a5f9 100644
--- a/Documentation/rpmsg.txt
+++ b/Documentation/rpmsg.txt
@@ -1,10 +1,15 @@
+============================================
 Remote Processor Messaging (rpmsg) Framework
+============================================
 
-Note: this document describes the rpmsg bus and how to write rpmsg drivers.
-To learn how to add rpmsg support for new platforms, check out remoteproc.txt
-(also a resident of Documentation/).
+.. note::
 
-1. Introduction
+  This document describes the rpmsg bus and how to write rpmsg drivers.
+  To learn how to add rpmsg support for new platforms, check out remoteproc.txt
+  (also a resident of Documentation/).
+
+Introduction
+============
 
 Modern SoCs typically employ heterogeneous remote processor devices in
 asymmetric multiprocessing (AMP) configurations, which may be running
@@ -58,170 +63,222 @@ to their destination address (this is done by invoking the driver's rx handler
 with the payload of the inbound message).
 
 
-2. User API
+User API
+========
+
+::
 
   int rpmsg_send(struct rpmsg_channel *rpdev, void *data, int len);
-   - sends a message across to the remote processor on a given channel.
-     The caller should specify the channel, the data it wants to send,
-     and its length (in bytes). The message will be sent on the specified
-     channel, i.e. its source and destination address fields will be
-     set to the channel's src and dst addresses.
-
-     In case there are no TX buffers available, the function will block until
-     one becomes available (i.e. until the remote processor consumes
-     a tx buffer and puts it back on virtio's used descriptor ring),
-     or a timeout of 15 seconds elapses. When the latter happens,
-     -ERESTARTSYS is returned.
-     The function can only be called from a process context (for now).
-     Returns 0 on success and an appropriate error value on failure.
+
+sends a message across to the remote processor on a given channel.
+The caller should specify the channel, the data it wants to send,
+and its length (in bytes). The message will be sent on the specified
+channel, i.e. its source and destination address fields will be
+set to the channel's src and dst addresses.
+
+In case there are no TX buffers available, the function will block until
+one becomes available (i.e. until the remote processor consumes
+a tx buffer and puts it back on virtio's used descriptor ring),
+or a timeout of 15 seconds elapses. When the latter happens,
+-ERESTARTSYS is returned.
+
+The function can only be called from a process context (for now).
+Returns 0 on success and an appropriate error value on failure.
+
+::
 
   int rpmsg_sendto(struct rpmsg_channel *rpdev, void *data, int len, u32 dst);
-   - sends a message across to the remote processor on a given channel,
-     to a destination address provided by the caller.
-     The caller should specify the channel, the data it wants to send,
-     its length (in bytes), and an explicit destination address.
-     The message will then be sent to the remote processor to which the
-     channel belongs, using the channel's src address, and the user-provided
-     dst address (thus the channel's dst address will be ignored).
-
-     In case there are no TX buffers available, the function will block until
-     one becomes available (i.e. until the remote processor consumes
-     a tx buffer and puts it back on virtio's used descriptor ring),
-     or a timeout of 15 seconds elapses. When the latter happens,
-     -ERESTARTSYS is returned.
-     The function can only be called from a process context (for now).
-     Returns 0 on success and an appropriate error value on failure.
+
+sends a message across to the remote processor on a given channel,
+to a destination address provided by the caller.
+
+The caller should specify the channel, the data it wants to send,
+its length (in bytes), and an explicit destination address.
+
+The message will then be sent to the remote processor to which the
+channel belongs, using the channel's src address, and the user-provided
+dst address (thus the channel's dst address will be ignored).
+
+In case there are no TX buffers available, the function will block until
+one becomes available (i.e. until the remote processor consumes
+a tx buffer and puts it back on virtio's used descriptor ring),
+or a timeout of 15 seconds elapses. When the latter happens,
+-ERESTARTSYS is returned.
+
+The function can only be called from a process context (for now).
+Returns 0 on success and an appropriate error value on failure.
+
+::
 
   int rpmsg_send_offchannel(struct rpmsg_channel *rpdev, u32 src, u32 dst,
 							void *data, int len);
-   - sends a message across to the remote processor, using the src and dst
-     addresses provided by the user.
-     The caller should specify the channel, the data it wants to send,
-     its length (in bytes), and explicit source and destination addresses.
-     The message will then be sent to the remote processor to which the
-     channel belongs, but the channel's src and dst addresses will be
-     ignored (and the user-provided addresses will be used instead).
-
-     In case there are no TX buffers available, the function will block until
-     one becomes available (i.e. until the remote processor consumes
-     a tx buffer and puts it back on virtio's used descriptor ring),
-     or a timeout of 15 seconds elapses. When the latter happens,
-     -ERESTARTSYS is returned.
-     The function can only be called from a process context (for now).
-     Returns 0 on success and an appropriate error value on failure.
+
+
+sends a message across to the remote processor, using the src and dst
+addresses provided by the user.
+
+The caller should specify the channel, the data it wants to send,
+its length (in bytes), and explicit source and destination addresses.
+The message will then be sent to the remote processor to which the
+channel belongs, but the channel's src and dst addresses will be
+ignored (and the user-provided addresses will be used instead).
+
+In case there are no TX buffers available, the function will block until
+one becomes available (i.e. until the remote processor consumes
+a tx buffer and puts it back on virtio's used descriptor ring),
+or a timeout of 15 seconds elapses. When the latter happens,
+-ERESTARTSYS is returned.
+
+The function can only be called from a process context (for now).
+Returns 0 on success and an appropriate error value on failure.
+
+::
 
   int rpmsg_trysend(struct rpmsg_channel *rpdev, void *data, int len);
-   - sends a message across to the remote processor on a given channel.
-     The caller should specify the channel, the data it wants to send,
-     and its length (in bytes). The message will be sent on the specified
-     channel, i.e. its source and destination address fields will be
-     set to the channel's src and dst addresses.
-
-     In case there are no TX buffers available, the function will immediately
-     return -ENOMEM without waiting until one becomes available.
-     The function can only be called from a process context (for now).
-     Returns 0 on success and an appropriate error value on failure.
+
+sends a message across to the remote processor on a given channel.
+The caller should specify the channel, the data it wants to send,
+and its length (in bytes). The message will be sent on the specified
+channel, i.e. its source and destination address fields will be
+set to the channel's src and dst addresses.
+
+In case there are no TX buffers available, the function will immediately
+return -ENOMEM without waiting until one becomes available.
+
+The function can only be called from a process context (for now).
+Returns 0 on success and an appropriate error value on failure.
+
+::
 
   int rpmsg_trysendto(struct rpmsg_channel *rpdev, void *data, int len, u32 dst)
-   - sends a message across to the remote processor on a given channel,
-     to a destination address provided by the user.
-     The user should specify the channel, the data it wants to send,
-     its length (in bytes), and an explicit destination address.
-     The message will then be sent to the remote processor to which the
-     channel belongs, using the channel's src address, and the user-provided
-     dst address (thus the channel's dst address will be ignored).
-
-     In case there are no TX buffers available, the function will immediately
-     return -ENOMEM without waiting until one becomes available.
-     The function can only be called from a process context (for now).
-     Returns 0 on success and an appropriate error value on failure.
+
+
+sends a message across to the remote processor on a given channel,
+to a destination address provided by the user.
+
+The user should specify the channel, the data it wants to send,
+its length (in bytes), and an explicit destination address.
+
+The message will then be sent to the remote processor to which the
+channel belongs, using the channel's src address, and the user-provided
+dst address (thus the channel's dst address will be ignored).
+
+In case there are no TX buffers available, the function will immediately
+return -ENOMEM without waiting until one becomes available.
+
+The function can only be called from a process context (for now).
+Returns 0 on success and an appropriate error value on failure.
+
+::
 
   int rpmsg_trysend_offchannel(struct rpmsg_channel *rpdev, u32 src, u32 dst,
 							void *data, int len);
-   - sends a message across to the remote processor, using source and
-     destination addresses provided by the user.
-     The user should specify the channel, the data it wants to send,
-     its length (in bytes), and explicit source and destination addresses.
-     The message will then be sent to the remote processor to which the
-     channel belongs, but the channel's src and dst addresses will be
-     ignored (and the user-provided addresses will be used instead).
-
-     In case there are no TX buffers available, the function will immediately
-     return -ENOMEM without waiting until one becomes available.
-     The function can only be called from a process context (for now).
-     Returns 0 on success and an appropriate error value on failure.
+
+
+sends a message across to the remote processor, using source and
+destination addresses provided by the user.
+
+The user should specify the channel, the data it wants to send,
+its length (in bytes), and explicit source and destination addresses.
+The message will then be sent to the remote processor to which the
+channel belongs, but the channel's src and dst addresses will be
+ignored (and the user-provided addresses will be used instead).
+
+In case there are no TX buffers available, the function will immediately
+return -ENOMEM without waiting until one becomes available.
+
+The function can only be called from a process context (for now).
+Returns 0 on success and an appropriate error value on failure.
+
+::
 
   struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_channel *rpdev,
 		void (*cb)(struct rpmsg_channel *, void *, int, void *, u32),
 		void *priv, u32 addr);
-   - every rpmsg address in the system is bound to an rx callback (so when
-     inbound messages arrive, they are dispatched by the rpmsg bus using the
-     appropriate callback handler) by means of an rpmsg_endpoint struct.
 
-     This function allows drivers to create such an endpoint, and by that,
-     bind a callback, and possibly some private data too, to an rpmsg address
-     (either one that is known in advance, or one that will be dynamically
-     assigned for them).
+every rpmsg address in the system is bound to an rx callback (so when
+inbound messages arrive, they are dispatched by the rpmsg bus using the
+appropriate callback handler) by means of an rpmsg_endpoint struct.
 
-     Simple rpmsg drivers need not call rpmsg_create_ept, because an endpoint
-     is already created for them when they are probed by the rpmsg bus
-     (using the rx callback they provide when they registered to the rpmsg bus).
+This function allows drivers to create such an endpoint, and by that,
+bind a callback, and possibly some private data too, to an rpmsg address
+(either one that is known in advance, or one that will be dynamically
+assigned for them).
 
-     So things should just work for simple drivers: they already have an
-     endpoint, their rx callback is bound to their rpmsg address, and when
-     relevant inbound messages arrive (i.e. messages which their dst address
-     equals to the src address of their rpmsg channel), the driver's handler
-     is invoked to process it.
+Simple rpmsg drivers need not call rpmsg_create_ept, because an endpoint
+is already created for them when they are probed by the rpmsg bus
+(using the rx callback they provide when they registered to the rpmsg bus).
 
-     That said, more complicated drivers might do need to allocate
-     additional rpmsg addresses, and bind them to different rx callbacks.
-     To accomplish that, those drivers need to call this function.
-     Drivers should provide their channel (so the new endpoint would bind
-     to the same remote processor their channel belongs to), an rx callback
-     function, an optional private data (which is provided back when the
-     rx callback is invoked), and an address they want to bind with the
-     callback. If addr is RPMSG_ADDR_ANY, then rpmsg_create_ept will
-     dynamically assign them an available rpmsg address (drivers should have
-     a very good reason why not to always use RPMSG_ADDR_ANY here).
+So things should just work for simple drivers: they already have an
+endpoint, their rx callback is bound to their rpmsg address, and when
+relevant inbound messages arrive (i.e. messages which their dst address
+equals to the src address of their rpmsg channel), the driver's handler
+is invoked to process it.
 
-     Returns a pointer to the endpoint on success, or NULL on error.
+That said, more complicated drivers might do need to allocate
+additional rpmsg addresses, and bind them to different rx callbacks.
+To accomplish that, those drivers need to call this function.
+Drivers should provide their channel (so the new endpoint would bind
+to the same remote processor their channel belongs to), an rx callback
+function, an optional private data (which is provided back when the
+rx callback is invoked), and an address they want to bind with the
+callback. If addr is RPMSG_ADDR_ANY, then rpmsg_create_ept will
+dynamically assign them an available rpmsg address (drivers should have
+a very good reason why not to always use RPMSG_ADDR_ANY here).
+
+Returns a pointer to the endpoint on success, or NULL on error.
+
+::
 
   void rpmsg_destroy_ept(struct rpmsg_endpoint *ept);
-   - destroys an existing rpmsg endpoint. user should provide a pointer
-     to an rpmsg endpoint that was previously created with rpmsg_create_ept().
+
+
+destroys an existing rpmsg endpoint. user should provide a pointer
+to an rpmsg endpoint that was previously created with rpmsg_create_ept().
+
+::
 
   int register_rpmsg_driver(struct rpmsg_driver *rpdrv);
-   - registers an rpmsg driver with the rpmsg bus. user should provide
-     a pointer to an rpmsg_driver struct, which contains the driver's
-     ->probe() and ->remove() functions, an rx callback, and an id_table
-     specifying the names of the channels this driver is interested to
-     be probed with.
+
+
+registers an rpmsg driver with the rpmsg bus. user should provide
+a pointer to an rpmsg_driver struct, which contains the driver's
+->probe() and ->remove() functions, an rx callback, and an id_table
+specifying the names of the channels this driver is interested to
+be probed with.
+
+::
 
   void unregister_rpmsg_driver(struct rpmsg_driver *rpdrv);
-   - unregisters an rpmsg driver from the rpmsg bus. user should provide
-     a pointer to a previously-registered rpmsg_driver struct.
-     Returns 0 on success, and an appropriate error value on failure.
 
 
-3. Typical usage
+unregisters an rpmsg driver from the rpmsg bus. user should provide
+a pointer to a previously-registered rpmsg_driver struct.
+Returns 0 on success, and an appropriate error value on failure.
+
+
+Typical usage
+=============
 
 The following is a simple rpmsg driver, that sends an "hello!" message
 on probe(), and whenever it receives an incoming message, it dumps its
 content to the console.
 
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/rpmsg.h>
+::
 
-static void rpmsg_sample_cb(struct rpmsg_channel *rpdev, void *data, int len,
+  #include <linux/kernel.h>
+  #include <linux/module.h>
+  #include <linux/rpmsg.h>
+
+  static void rpmsg_sample_cb(struct rpmsg_channel *rpdev, void *data, int len,
 						void *priv, u32 src)
-{
+  {
 	print_hex_dump(KERN_INFO, "incoming message:", DUMP_PREFIX_NONE,
 						16, 1, data, len, true);
-}
+  }
 
-static int rpmsg_sample_probe(struct rpmsg_channel *rpdev)
-{
+  static int rpmsg_sample_probe(struct rpmsg_channel *rpdev)
+  {
 	int err;
 
 	dev_info(&rpdev->dev, "chnl: 0x%x -> 0x%x\n", rpdev->src, rpdev->dst);
@@ -234,32 +291,35 @@ static int rpmsg_sample_probe(struct rpmsg_channel *rpdev)
 	}
 
 	return 0;
-}
+  }
 
-static void rpmsg_sample_remove(struct rpmsg_channel *rpdev)
-{
+  static void rpmsg_sample_remove(struct rpmsg_channel *rpdev)
+  {
 	dev_info(&rpdev->dev, "rpmsg sample client driver is removed\n");
-}
+  }
 
-static struct rpmsg_device_id rpmsg_driver_sample_id_table[] = {
+  static struct rpmsg_device_id rpmsg_driver_sample_id_table[] = {
 	{ .name	= "rpmsg-client-sample" },
 	{ },
-};
-MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_sample_id_table);
+  };
+  MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_sample_id_table);
 
-static struct rpmsg_driver rpmsg_sample_client = {
+  static struct rpmsg_driver rpmsg_sample_client = {
 	.drv.name	= KBUILD_MODNAME,
 	.id_table	= rpmsg_driver_sample_id_table,
 	.probe		= rpmsg_sample_probe,
 	.callback	= rpmsg_sample_cb,
 	.remove		= rpmsg_sample_remove,
-};
-module_rpmsg_driver(rpmsg_sample_client);
+  };
+  module_rpmsg_driver(rpmsg_sample_client);
 
-Note: a similar sample which can be built and loaded can be found
-in samples/rpmsg/.
+.. note::
 
-4. Allocations of rpmsg channels:
+   a similar sample which can be built and loaded can be found
+   in samples/rpmsg/.
+
+Allocations of rpmsg channels
+=============================
 
 At this point we only support dynamic allocations of rpmsg channels.
 
-- 
2.9.4
