Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884715;
	b=uPEJXpKhRy3MGKVym1NQ9tEJF0pP/Dkc5KKf7hw3ixQnA9Ss43k+YUezFDhhXcOD4hYI
	 g/ZdQvZqrx3V/RbdTTRc2KHBaaHfFtcnDN5mgqXdR+OAG01487s6JPttpmTrUcUjaCuAQ
	 26XR8S9Yb7ak6pkHy+ksIa+Rb0YuNClst8OdW5LIMg79mkx2eUKzMxYqLq0urDewdKZWW
	 AKKL+v+2BfSqGF9K/CTBJGxP6T1LqRPgwx75s2YtWwkVp4S3YlKT//UGoYQ6B6/TZVM+y
	 ig2FszMVq90dJjEGAJNxae3fm9uF8bUkMiIvmExSSLNK8o6vVQN99e2K5LoIRwZKYBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mCoALzMhu5q7+FAJc0HEyB8F4qmrYW3UsJsZLcqOZX4=;
	b=mjQ1s9WVWosKCLry0LvGFnBQT9lqNNqezkZDdkbMYazSWsi91pWG6Ou6ZgskuGMz7czr
	 G+j58u77xh+YctYndz6/thidJL9hAr86C6FrOv0ccaXjdsmwZLEaxaxVl4R5SUA90V5su
	 shqagmzHhYOZVpS3eWuCiTb+TmnLCzap8a5oExu5dhivZB6CWIlIbpMxqRq+02MjjPjGK
	 8SsYM0Pxt1XZbmFswQYZXeGRCK/pKnr70t1DtlgAjRC7pu7VX9VOAUcjI80ntDACg9Y4a
	 PRUIzbBaMliFvl7T3emwJXzIDMWIyAgetcV8DEeW9UcQy6tvqI+ucj7bhH8/pxwKQYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xjR7/BNc";
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EA2606A329
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 03:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56EA2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjR7/BNc
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53644b28706so36813131cf.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 19:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884714; x=1795489514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCoALzMhu5q7+FAJc0HEyB8F4qmrYW3UsJsZLcqOZX4=;
        b=xjR7/BNcxJw6s62M/s+PdhaTGRoIONz4etd8ABsWI4I9NKfSdNlDj0TddCPf02hnZz
         lD3LxUVkgZ3r6ulmA/U4G4bxkKqafcPQ8yj4+UCUruC3FGh644jW9RrAWX5Hwr/lhzcT
         Qarvkt/O1ecdlybAFOS90B/d5oTWMeSh7opB+CcxUg+9mKmUPSYqdtHZEWtW22MkxIVS
         ehPOd7Ml0WXYSWllhmH10Q27i23Y8YlOnIolDHUVl5pZV1SbCBAaCPRIsS00m4As8QrC
         So8fEpJxSXKuSI5t5CJK088L7VOOjUXfcL9uRuHiWa9xIAo7lZq/fSUoUTUi+zFY+n5f
         FZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884714; x=1795489514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCoALzMhu5q7+FAJc0HEyB8F4qmrYW3UsJsZLcqOZX4=;
        b=NzNy+/7X60o9irSmCqox3Y90N4XDT+qGGxgI6pev7LQQSl6wlr0NmqYG5dWpxrmW/x
         RA3LPscVLMbg6D1y34eJVljxHErCs+TBNzeNeSWV6q2sNQLP6cez8++E2OCNhoaq0WXv
         7Wpn8RTyTo41jLQJGqLYhg7q9kTOM9vpyJOy3+0yyD/IWbCmWp7vgTw+hoAyfrDZNBUQ
         K6zenxunTt38AQzV7MRv6l/Tt80qnf85jmBTWtmzV4hZjxwc9LiJHWxPyckvupt7+sgP
         NiuLGVNdCDwgSoKLf40kP1L4zcaWveM2xPKxxtAV0/JkhKuHWEWHcPmUp/47X3eVuDrN
         tKUw==
X-Gm-Message-State: APuU4Z8OTiN5tSEpHIPa9eOoG40064y9Ld+VHUkQYsK2Bty39g1HEglW
	OmrYwjcQRCxH03DbiUg9GNsLxhUDhWop12H8pk8OjgeFcAqaFJVTlqzv
X-Gm-Gg: AYBFou1SMrd+gkwe1/1v9agoV1ec9q5s4g08cozmigHy55bBokgJ2Pm/KupDEQHx02Z
	VK3byGyymQ2ufmKhGkIzZJMagrA8Bd57dcetv/lobZFob4kL7cQAJEDc+u2VRoKlggvHh8t8VRp
	N3DBCKdTv6kyPcKPDxYVL8UrDuMXHho4VeG3JVDpy16G+0dStMekp9u14gz/r5udZCoXtUMB3W9
	op5KEVhpwwoau/zN9NPSSp+Q0CYUcEjdFRZljO2kPe4sESSp4/QbWcraf4f+Jc+ct0Tc6CEDveF
	Dus9thBCxC7xzLj7jopKOSXSEgY7FbIIu8L3oISOwI87UjroItLSss7Isd21FRcpQs+550tPF8g
	dMM5wbH7dZskMAB+1cxk1oLHm8UswAGTjDakykpH9C4K6yjb2LnPz05uETIdhNYrB3rzw6MZurU
	DrFXaNOCTSb/A8cAsHPGySQigMtDkX8XROyzzfG1J4GKOALNoN+7wHAv+h89+UuHVJ27VDVseoG
	oU7ajBTwY94XKwqw7JNRK4ScpgEazugQdNMDsXn81fAu2x6i+yDaZ5Lp7+h9W2vBPn5hivPeN9G
	BW+afhNqoarwgjuY+5l7syLdgzpvmVRt38DYQmBb5yQyZJcoCBwmRs05tGfb/0KvaoC8lQ7BCGM
	=
X-Received: by 2002:a05:622a:c8c:b0:55d:3695:c1b8 with SMTP id d75a77b69052e-55d3695c801mr97933321cf.11.1794884714307;
        Mon, 16 Nov 2026 19:05:14 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d453casm100066256d6.10.2026.11.16.19.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:05:13 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] rpmsg: glink: hold idr_lock while completing open_ack
Date: Mon, 16 Nov 2026 22:05:09 -0500
Message-ID: <20261117030509.1708983-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

qcom_glink_rx_open_ack() looks up the channel in lcids under idr_lock,
drops the lock and then completes channel->open_ack.
qcom_glink_create_local() waits for that completion for five seconds.
If the wait times out at the same moment, it removes the lcid under
idr_lock and drops the last two references, which frees the channel.
The OPEN_ACK handler then reads channel->name for the trace event and
calls complete_all() on freed memory.

Keep idr_lock held until complete_all() returns. The timeout path
removes the lcid under the same lock before dropping its references,
so the channel cannot be freed while the lock is held. Taking a
channel reference instead would not work here, because the handler
runs in interrupt context and the final put may call
cancel_work_sync() from qcom_glink_channel_release().

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus MAILBOX, RPMSG_QCOM_GLINK_RPM
and W=1.

 drivers/rpmsg/qcom_glink_native.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index f848ab46161d..862565bf965d 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1101,16 +1101,17 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
 
 	spin_lock(&glink->idr_lock);
 	channel = idr_find(&glink->lcids, lcid);
-	spin_unlock(&glink->idr_lock);
 
 	trace_qcom_glink_cmd_open_ack_rx(glink->label, channel ? channel->name : NULL,
 					 lcid, channel ? channel->rcid : 0);
 	if (!channel) {
+		spin_unlock(&glink->idr_lock);
 		dev_err(glink->dev, "Invalid open ack packet\n");
 		return -EINVAL;
 	}
 
 	complete_all(&channel->open_ack);
+	spin_unlock(&glink->idr_lock);
 
 	return 0;
 }

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

