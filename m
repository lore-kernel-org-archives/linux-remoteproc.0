Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-pf1-f179.google.com ([209.85.210.179]:46818 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726544AbeKGRFa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Nov 2018 12:05:30 -0500
Received: by mail-pf1-f179.google.com with SMTP id r64-v6so7331395pfb.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Nov 2018 23:36:21 -0800 (PST)
Received: from WIN71807150011 ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 22-v6sm15985176pfs.108.2018.11.06.23.36.19
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 23:36:20 -0800 (PST)
From: "Xiang Xiao" <xiaoxiang781216@gmail.com>
Subject: Regression by commit 7e83cab824a86704cdbd7735c19d34e0ce423dc5
Date: Wed, 7 Nov 2018 15:36:04 +0800
Message-ID: <037a01d4766c$8baaf750$a300e5f0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: zh-cn
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This commit replace rproc_{shutdown,boot}() with rproc_{stop,start}(), =
which
skip destroy the virtio device at stop but reinitialize it again at =
start:
[ 1502.733760] remoteproc remoteproc0: crash detected in
f9210000.toppwr:tl421-rproc: type watchdog
[ 1502.744019] remoteproc remoteproc0: handling crash #1 in
f9210000.toppwr:tl421-rproc
[ 1502.820741] remoteproc remoteproc0: recovering
f9210000.toppwr:tl421-rproc
[ 1502.831588] remoteproc remoteproc0: stopped remote processor
f9210000.toppwr:tl421-rproc
[ 1502.844458] kobject (ffffffc0b8d1b898): tried to init an initialized
object, something is seriously wrong.
[ 1502.855415] CPU: 6 PID: 169 Comm: kworker/6:1 Tainted: =
G=A0=A0=A0=A0=A0=A0=A0 W=A0=A0=A0=A0=A0=A0
4.9.27-04453-g1a03c96 #253
[ 1502.865442] Hardware name: Banks (DT)
[ 1502.869557] Workqueue: events rproc_crash_handler_work
[ 1502.875319] Call trace:
[ 1502.878066] [<ffffff800808bd9c>] dump_backtrace+0x0/0x1cc
[ 1502.884106] [<ffffff800808bf7c>] show_stack+0x14/0x1c
[ 1502.889761] [<ffffff80083fef08>] dump_stack+0xa8/0xe0
[ 1502.895415] [<ffffff8008402b24>] kobject_init+0x8c/0x9c
[ 1502.901262] [<ffffff800853758c>] device_initialize+0x3c/0xe8
[ 1502.907590] [<ffffff80085397d4>] device_register+0x14/0x28
[ 1502.913727] [<ffffff80084b777c>] register_virtio_device+0xc4/0x114
[ 1502.920641] [<ffffff8008878b20>] rproc_add_virtio_dev+0x7c/0x108
[ 1502.927360] [<ffffff8008875cbc>] rproc_vdev_do_probe+0x14/0x1c
[ 1502.933883] [<ffffff8008875a60>] rproc_start+0xac/0x1ac
[ 1502.939728] [<ffffff8008877a68>] rproc_trigger_recovery+0x2f8/0x324
[ 1502.946740] [<ffffff8008877b24>] rproc_crash_handler_work+0x90/0xb0
[ 1502.953752] [<ffffff80080cd570>] process_one_work+0x204/0x704
[ 1502.960179] [<ffffff80080cdac4>] worker_thread+0x54/0x4a8
[ 1502.966225] [<ffffff80080d4aec>] kthread+0xec/0x100
[ 1502.971683] [<ffffff8008083890>] ret_from_fork+0x10/0x40
When the crash happen, It=92s better to destroy and recreate all virtio =
device
and it=92s children(rpmsg device) again to match the remote side state =
like
the original behavior.

Thanks
Xiang
