Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009079;
	b=icyChDwHh8sXLyW4P//9oMuqahurq7NFL20t1+shdtPTdMH8OIdTGsRVxxpPJH/TxZbr
	 DN+bLBYjryBwSVuPlvL81SRJGae6FGvxu7hDzzm6i8wcOla9H9Ed5FG8N8u6+UQEw44bY
	 etYQhRDO8qGTA7s43neEIllSLOM3TA0jMijxBrYdKEFy9KXbicQ9h8l2+0LKPQVTBSy/i
	 j/tXySRNc6mWuXXR5hyrOubq1Rf/+eOAAY7VNBiKPOFLAQLGy7Sa2tPs64prLBiLjbHft
	 HgGK3DP/EhIWDeMzGav62JLjZYoHyb3MALNdQ/a74Mf0U87OzJKmoa1fhmpOazWEbeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=rDp7+2O7MU6X785H/wA9kb/1vBQL6oD+1K7g8ImgNt4=;
	b=f42/kdISzE2SiKmjC4GtYogXwybcoAvv2SuM2i+rJD77q20aiT+PiIrvjMQklI3lrROT
	 3CbBLl9bDnKm8U++Aw73yVVGDtUV01kgHv0+gAog5OQdFqoBNsSUcKxis3zDD5HVUhcn8
	 YCptjnwsGppEELuA4w24wLkK10x99EYwcsdeBAb1vKUoyzVcQ+fcyPEUBnvHci0A2yfdw
	 3lApbxs+9ZDpPBYZkaaYS8G55vUbvxEHAtSJfkv5CTjyJWKLgFrrltPMI/lJydCmKdKUJ
	 W+rAF1KX5dmO9H8er0g3nWXx3wYO42GavbKnAdsIqpgnb/bp0LNSDqFlSzIELvH4ijw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="UI/H7fym";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA96606A325
	for <linux-remoteproc@vger.kernel.org>; Mon, 26 Oct 2026 10:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA96606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UI/H7fym
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1832382a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Oct 2026 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009077; x=1793613877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rDp7+2O7MU6X785H/wA9kb/1vBQL6oD+1K7g8ImgNt4=;
        b=UI/H7fymCCV5R8hXtpI07lGH3/oPJ2lwNaDRFtBfJ2Z98WNqgB7BIhhNR5neQc+sBC
         3iXk3PsFzag2MjYDv0EDhjpGZzt3CyIa1WiUO+EpXrjVAgEltLNFy5lE71bluKr8Hbq+
         4xbrzmUYbRrihK6YHm6FZUTZLrCDfh49FpFjYlpA42yU8QmoUrHEDCfMu2qwaPuJ66sv
         qXKUcSu4j9N7ZTUZK7xMA7IPIesrntAfupirllGS5Krn3vDBELoAzBValbjdnSBotsYF
         Dl7WY9NeVBWjP0eP7ROQJYqD4jfFXAEyey686yMiA/LXm4elu3hwqyuz7+U8v6L8ESMJ
         +cSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009077; x=1793613877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDp7+2O7MU6X785H/wA9kb/1vBQL6oD+1K7g8ImgNt4=;
        b=lYr1eRYf2VNtFFhie79XRxtAt6+MGmasPgYf6Lid/Ho9jTMzz54LLzl0e3Ij+PZRRX
         uZLA6Rhr0L1kuFaWglgKs1yaTuA87Lu979CIb3SdIYaH81eQ8oalyWxAT/ugSTawatm2
         GYzpb+dh/Lpz8Mas6KLGWSzyLNSCzEEfLfJY17ciFjUMK8pSYBpDCR+7EsXZyRTBq9Ep
         eN909PAUlT2GIC/uZ4vW9HrJq4apUNzFwiKMlv4XflW3NkynNVDueJfFqp9dmP1PdiiO
         XuVinY05AHYWidLjp47E8OClFyRfDw4Ah6FAAh1Onpxj/7mAEZe0LOX6jjxRp3K/NQgl
         9+Lg==
X-Gm-Message-State: AFq9FYLfF0q7MI3Kc+/xozLQqyZ4Bq3GajkI9EncRpSQMRdnHzmbsmiY
	td5V/IwyID4SjM22nJpdUh7N/t73Iz+aNwV96JMO9d9mWwUzV+Zxakja
X-Gm-Gg: AYBFou2PzeSFG6IIIcR6JkmBTdBT5yzK/InybB/OqveK39l8mithxgzh+pew+inGtDy
	5oJ9cYASJtb4i4hD9zur2NB4BindmQvIfYzHUMtyJrGgq1jt6xmFzutdsfzajaeokAijdMQoML8
	WRUgN6zlAhUwdVA37rkWHN7CDU4tJqu7wlZFYKidf5T2JFTTR1aiccheTbCfJg9llBJ4ozDL3uq
	U+wjgCDbjNSeOprrxYa6tvTTchdLA7HnBbLrahWVb+C0XZsR+WUEODpPvbz8Q2YqPqMNveEpo4a
	6kmLPZUGoR7AeTeLznPRxDc4KehFSJOIRjiq+zP2GfuDvaLlyfDiT4ErV3ndXffqg7b5v+Xoeop
	f5X1QV18qqgM8xRDpwaN6h+KmouhKmcRl65rP6dX9eIXF2/wOfPrSfEX4qKQDYVnsQOKqQBbNDe
	KbBR0tWXr0Ou6PMpfIKyi2CDBKfPPXn8DrrUY93yOA4/dgkv73P5Nmh8XJDqC18Msp50vGNNzc8
	+7ppvWX/eHarRwfKgZy9/IVFjGTNuWoDQk11MGTPR4tSl7kNpOpcjEQ+JxEqJZrCyLUSlw3VJGy
	3JaPSr4TPYFgvpfr8JZvX/DDblYwchxwwP76htYRKaCzbcUZmVQWdjNGmVHG+eAm67ijpp18bn1
	qA2J4Vb36Rp7HVIx66OFPKp/dSuOR
X-Received: by 2002:a17:90b:2d86:b0:3ad:ce18:50ad with SMTP id 98e67ed59e1d1-3adead57bfbmr5784240a91.22.1793009077115;
        Mon, 26 Oct 2026 03:04:37 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebac408asm7912647a91.0.2026.10.26.03.04.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 03:04:36 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH] rpmsg: char: take ept_lock in the SET_INCOMING_FLOWCONTROL ioctl
Date: Mon, 26 Oct 2026 20:03:06 +1000
Message-ID: <20261026100306.68019-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

rpmsg_eptdev_ioctl() handles RPMSG_SET_INCOMING_FLOWCONTROL by calling
rpmsg_set_flow_control(eptdev->ept, ...) without holding eptdev->ept_lock
and without checking eptdev->ept for NULL. rpmsg_set_flow_control()
dereferences ept->ops, so this is the only eptdev->ept user that does not
honour the ept_lock discipline.

eptdev->ept is torn down under ept_lock: rpmsg_chrdev_eptdev_destroy()
(reached via RPMSG_DESTROY_EPT_IOCTL on a second fd, or when the rpmsg
device is removed) and rpmsg_eptdev_release() both do

	mutex_lock(&eptdev->ept_lock);
	rpmsg_destroy_ept(eptdev->ept);
	eptdev->ept = NULL;
	mutex_unlock(&eptdev->ept_lock);

and rpmsg_destroy_ept() drops the endpoint's last reference and frees it.
A SET_INCOMING_FLOWCONTROL ioctl running concurrently can therefore read
eptdev->ept just as it is freed and dereference ept->ops -> use-after-free
(or a NULL dereference once ept has been cleared).

The other eptdev->ept users get this right: rpmsg_eptdev_write_iter() and
rpmsg_eptdev_poll() take ept_lock and re-check eptdev->ept before use. Do
the same in the ioctl. Lock only this case: RPMSG_DESTROY_EPT_IOCTL calls
rpmsg_chrdev_eptdev_destroy(), which takes ept_lock itself, so the switch
as a whole must not hold it.

Fixes: 5550201c0fe2 ("rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/rpmsg/rpmsg_char.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 550fda2..49c0784 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -343,7 +343,15 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 			break;
 		}
 		set = !!arg;
-		ret = rpmsg_set_flow_control(eptdev->ept, set, eptdev->chinfo.dst);
+		ret = mutex_lock_interruptible(&eptdev->ept_lock);
+		if (ret)
+			break;
+		if (eptdev->ept)
+			ret = rpmsg_set_flow_control(eptdev->ept, set,
+						     eptdev->chinfo.dst);
+		else
+			ret = -EPIPE;
+		mutex_unlock(&eptdev->ept_lock);
 		break;
 	case RPMSG_DESTROY_EPT_IOCTL:
 		/* Don't allow to destroy a default endpoint. */
-- 
2.43.0

