Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740469;
	b=fJ5nWjSIxBqX8TLOBO+nMswd+tj79bWJ52ED2m/JgBmWoIs8pKuHzxvd8FOzsxcfB0Uv
	 +GdgydvtVObc//U/QxPP2p5fAmG32oOf9VxvU0KFemQHWZXhwESAoOky5Vpz3qvFa2MoT
	 Qv74BQRuoHs9hpdN5Lz+F9Rjx2RwMjCd5V6dDn8Rul+BME4uKbWWNlScQbjrbj5RQ7HP0
	 ZiiuHyeSIpxNpSyJbq5+FBixLEXlq8Rl8tWiOONe5w1BZ0WTGP+rlM5teItDmnt2cZsBl
	 tuVpQo33z0juAr+1Dow+ZsLXqAGQLQuSskpfGCKv/J3uQeMJ/LtEzI0uYmsnXZkIjwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740469;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Envelope-From;
	bh=KXmkByd7nhrM8DHyx9NIq+xwTqZ89r8cve7wcX43gns=;
	b=SUDNbVtiMhboAqcL6nYKlo/DrcoORwykZFlnlXTSWt/pzb54OMo9i0LKUPZsW6vF63lZ
	 +1FfcyxAFQvSRpwL5cpszwgaWZVH5+pEA3Fwy/kSNwCVTDi4GypyXMuOqicd5VAePXz7t
	 4DJfEDyFtDlmSbo2uIwg0LRVpYv4WmDdk1eIjJfzQS0I0zQaZetL2lp9LUkRj71ApE8rg
	 jf8CiTpDYIyeeaiGnXXsvvAqc9lggTYsgzGc+ODzpdJcwblwiQl+h+pvXJx8GeuPyFGt5
	 2JaAjA6KJq1V88dJ4giKeP9/nM2JwisGN/S3z+FZ9c8cVX1hJsRDln15RnEIs6f3hiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=LcD09Kta;
	arc=none smtp.remote-ip=198.54.127.151
Received: from out-2z4y-a151.jellyfish.systems (out-2z4y-a151.jellyfish.systems [198.54.127.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0733606A32C
	for <linux-remoteproc@vger.kernel.org>; Sun, 15 Nov 2026 11:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0733606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=LcD09Kta
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jS7MT43Bkz8sWR;
	Sun, 15 Nov 2026 11:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794740455;
	bh=KXmkByd7nhrM8DHyx9NIq+xwTqZ89r8cve7wcX43gns=;
	h=From:To:Cc:Subject:Date:From;
	b=LcD09KtaHOhgQkbE8jOcYYgL24f2/X0XwsEJw16NYr8c3i9kD8roCwrDVrnGg70xu
	 7c8HAEbe5gTuX2Bba2akmX8hInWjsYypJ0VyRZHHjc960Vp/bANpOXJMeywy6Kbhcc
	 7a+FxO5ZdEPNE9qM80jE1C+d6IFCPU5SrNBCSRTRHG221Vhd7mxQZIKoFXj71aBaM/
	 0CpHnXcxPLh1DGsdU9iSL86i1rhFnkjWQdbKfb1nuuypw+n+AWSXfYZ3oJx2kxau4l
	 XJtFWXOpwWiHX0O/+PbBL1Vy3ACm9eGetY6z/89SaPKRHKs9/oW5zlLCZrR0QFo4uq
	 BXTZiUbYsc4UQ==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Chrispine Tinega <dev@chrispinetinega.com>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rpmsg: char: Drop messages that arrive while the device is closed
Date: Sun, 15 Nov 2026 13:59:29 +0300
Message-ID: <20261115110040.363306-1-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: dev@chrispinetinega.com

A char device bound to an rpmsg channel reuses the channel's default
endpoint, and that endpoint stays bound when the last file is closed.
rpmsg_ept_cb() keeps running and appends an skb to eptdev->queue for
every message, with no limit. The queue is purged only on release, so
nothing frees it while the device stays closed.

An endpoint created through RPMSG_CREATE_EPT_IOCTL does not have this
problem: it is destroyed on release, and messages sent to it while the
device is closed are dropped by the bus.

On a TI AM62x whose M4F core sends about four 64-byte messages a
second, kernel memory that cannot be reclaimed grew by 2.2 MB in the
10 minutes the reading process was stopped, about 850 bytes a message.
At that rate a reader that is down for a day holds about 320 MB.

Drop a message when no file has the device open, as the bus already
does for an endpoint that does not exist. Release already discards
whatever the last reader left unread, so delivery across a close is
not something a reader can depend on today.

Fixes: bc69d1066569 ("rpmsg: char: Introduce the "rpmsg-raw" channel")
Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
Tested on a BLIIoT BL350 (AM625) running TI's 6.12.57 kernel, whose
rpmsg_ept_cb() is the same as here. The patched module was built
against that board's own vmlinux. With the reader stopped for the same
10 minutes, SUnreclaim stayed flat (33,300 kB to 33,220 kB) where it
had grown by 2.2 MB without the patch, and the link worked after the
next open and after a further close and reopen. Built for arm64 on
rpmsg-next with W=1, no warnings.

The callback reads eptdev->ept without ept_lock, as read() and poll()
already do. A message that races with open() is either queued or
dropped. One that races with release() can still be queued after the
purge, and the next reader gets it, as every such message is today;
that is at most the messages in flight, not an unbounded queue.

 drivers/rpmsg/rpmsg_char.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index d8868faac..18813db1a 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -112,6 +112,14 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
 	if (!eptdev)
 		return 0;
 
+	/*
+	 * A channel's default endpoint stays bound while the device is closed,
+	 * so this callback keeps running. Queuing now would grow the queue
+	 * without limit until the device is opened again. Drop the message.
+	 */
+	if (!eptdev->ept)
+		return 0;
+
 	skb = alloc_skb(len, GFP_ATOMIC);
 	if (!skb)
 		return -ENOMEM;

base-commit: 55f8464acbac850d44493073cb516ae91173f495
-- 
2.53.0

