Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94618519914
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907283; cv=none; b=rSPK6A38MVDraeMC7k4rGbVK18dZnKFJP9fl1jQclEalVZ5B25l0mQ/5P6FoSEOBvNWYR92+aO/z7yHMKkvMKF6bKtS1pR/KWGCG+FGhHnopFAycbAhzPFeiW8g0BMbWvm7f03CvLlNUvXazMbu8nN2uYSDHqxIsdFwUR+9NgHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907283; c=relaxed/simple;
	bh=SMznr1+oua/2qEKTz0POLUcGPBMFBEmKpz7KcAVzEjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IfNS8RdaT7k7W0zxqyT2sif4hL9oX61O1twrpDwdAUVlvvib1AgNZj5lRaDJivFqnmDEw/EZEU88HIV5UTE+oAl0gr8N2T1PWS5TEmD3zlDGYZCiALU70AEClOVDaBYlxAqJcacjl1v0eWjSsPU+0DbZV64sd9p2kRXIDQU9t18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B34vAHIO; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B34vAHIO"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so2598438eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791907280; x=1792512080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UiFg30G9iBV3RvOCZyarLUxmnA0aX4BHz4YxkGJgZuc=;
        b=B34vAHIOZZZxUKy7baC50AKRiFji2NyMh6H/xB5OH2WBJk5Y3dYU9ny1zEKIi/Tv4L
         3h+uAJvPQvTDD6rH+ssflIgIiqQ9HBlL6Q9g5z91a1m0OI0nKIbkx2gZkT9wPk6cFR3d
         G+SuufgwRMzTNRhC5RfEZCdSgv04do+xaBeUgvdQvwxooHlDB8WD0QwoRdS2heLOGPrL
         7Llpohmi1vzIWmUwnfRtFEnzYortOgzHkaAdHU+Uii0AiQW+P2U9Hx4I1H+cbKnr9iJ9
         jpDxr+2xEUdaJ5HcgOt1eXTJ77HdnTRI/i+Bi0/gSOYEwXNSkeL42pSMqLr/jZB9wfI9
         8Hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791907280; x=1792512080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UiFg30G9iBV3RvOCZyarLUxmnA0aX4BHz4YxkGJgZuc=;
        b=aaqH8VFBbABFvauq5Qs68XtpZF9QfkN5+YNe19DQ+1VHZMGRl3iS8Y+nLxUS/KvvjK
         W//sMeLBN9uzeJmCoCkBAbQZe9H7mnQlLXJgYHHEx+CQVf3CBrxoREgyljWWbUHnGNAO
         EZxSG8rrpE491Dp2rxQSevQ9Np9QBFb+NdZ1KgCHRzX/dEPr9zYOddoMd2SQBRDxQU7W
         2Uv5PB49BfZbfqc0lasnNaL2mfDaHGsLVXGZLAxWLLT2DNP2ZPCriGOBa2l+j9PxSv/N
         ZZhtZl3r5Iw8oEU0936DO4IlOW1CTU2WYV12mu5H6KWwywwn615vJzYRCF6x+ApkrBWZ
         tN+A==
X-Gm-Message-State: AFq9FYJfwKt3k6jkToZRSNvJ79rLn79aNX7Bg2vuJpykJNa9wupmm+j5
	IOVXFvZOdrR7V6XiZE1d+HdAbBrk3uSXRonVUxwxZQGRjm1UR6CJZPdN
X-Gm-Gg: AYBFou045RebFROSLURmRheSoKPrBgs4Ju+Eg19p4MFQRSsfC/HemRwvDhs5EjHI7u+
	bYHUZUqkGavvf9kVF14zdVHsNJ04yjNhX+0S3PGh7hNgRbpgkntb7vPmeBOs1Y52+TUZdWnhzlO
	evJZAAKBYh/TqPsdjQo1d8q4NHnRhirpummkaxvdeU+4snT8Dy0nlo0RCXdCsp9U38AhIX/TYO1
	lL5jOJ2HIorKi+1o6uE29FoIGPiY0wb05UTfvY+bLqIaW4KS4MMGAky3wOXRUjuLU9GIvmqmOXv
	LGqPgkr0FuQd5TCO9uCpcZYMlnHKVJMt85hS59PAF5HGx5Nikn1YQ40UyRGzBnOihSdZwgYRzhR
	tHh/xgrZlOBomru9zO0HwildYP3rzppBkjMBN/Xd0q1pdpmDGdXDORKAX7ulKWLvO32NZkkzhOA
	O93hfgWupc+F6Tl4xjiDwtAXmvmr662z8pQaYWo8qQkliR7DZpD1khxDT7YEVp4qPPARThQeeMh
	A==
X-Received: by 2002:a05:693c:20c3:10b0:35c:afc2:a752 with SMTP id 5a478bee46e88-35cafc2a8acmr2439356eec.7.1791907280277;
        Tue, 13 Oct 2026 09:01:20 -0700 (PDT)
Received: from JMD ([117.213.200.3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d202sm43069350eec.13.2026.10.13.09.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:01:19 -0700 (PDT)
From: Atul Akella <atul.akella@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	Atul Akella <atul.akella@gmail.com>
Subject: [PATCH] rpmsg: virtio: fix error handling in TX buffer wait
Date: Tue, 13 Oct 2026 21:30:55 +0530
Message-ID: <20261013160055.1362-1-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TX buffer wait loop in rpmsg_send_offchannel_raw() ignores the
possibility of wait_event_interruptible_timeout() returning a
negative value, which happens when the wait is interrupted by a
signal. In that case the loop spins back around and re-arms the
wait instead of propagating the signal, which can stall a task
that is trying to be killed.

Separately, on a genuine timeout (return value 0) the function
returns -ERESTARTSYS, which is reserved for signal-interrupted
syscalls that the kernel may restart. A timeout is not a signal
and should not be treated as restartable; return -ETIMEDOUT
instead.

Handle both cases explicitly: return err directly when negative,
and return -ETIMEDOUT on timeout.

Fixes: bcabbccabffe ("rpmsg: add virtio-based remote processor messaging bus")
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 1b8bb05924af..a32772d6ccbc 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -536,10 +536,13 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 					(msg = get_a_tx_buf(vrp)),
 					msecs_to_jiffies(15000));
 
+		if (err < 0)
+			return err;
+
 		/* timeout ? */
 		if (!err) {
 			dev_err(dev, "timeout waiting for a tx buffer\n");
-			return -ERESTARTSYS;
+			return -ETIMEDOUT;
 		}
 	}
 
-- 
2.51.0.windows.1

