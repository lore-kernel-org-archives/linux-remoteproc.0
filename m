Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BEE2E92D4
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Feb 2026 18:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265504; cv=none; b=n3kcCNHu7YMgKD0amUY8T0jZUWta+y0JR3/y+7UIUVC+AjK8FMzI3NELsXZF6wv6KNNsF3Gn5nOHa1gcOkR7hSCuS4v0/pVlmfKVZ6AN9IVCSWYbJtfd34ixrTSVjGV5qpoAvT/lBt9oLu90bqWALh0/ZyE1Ti0vzqKFwRAQhnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265504; c=relaxed/simple;
	bh=1LwO0v04lIfnNg2Y8tO3ZD/AcNQmoxD04js80NYmaIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r4l5MfeD/HghJo25iR6UwOzjB8PRRw5nupeq396s7ZECHpHDP6PWURniVvUtXMR9MDjO9jr2R5MLaLuse696U/7cOaH/u5meUFjRK5QQnbY9lCjnB0M37CUKjtFCYaqgZj/ASlUHIE93C2AMcBOXjRNBUz8VfSi93w1xffQmE2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cRYNPB1A; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cRYNPB1A"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-126ea4b77adso4062315c88.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Feb 2026 10:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265503; x=1771870303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McVpUeglzEgOwVzdcsjAkstJ2kz3KalaGrnYqtVtRLI=;
        b=cRYNPB1APEtIU0So2QDoKNkCQS7tQJDs6p2bpeoyGHMRLTksWAeITTEYb7lLWGSUFB
         0Io7r2sAI7XCxnvEO4PkS6uaauR4sEEAs0DteGoylzPCkA6GDp5d4SrUK/kzM0CkaaN3
         x/l8gpLZ9hstQZsE9EqlFyC64odw1/Gt2cSsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265503; x=1771870303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=McVpUeglzEgOwVzdcsjAkstJ2kz3KalaGrnYqtVtRLI=;
        b=ciQrco+grp6+JzIg81MfBlfVC1ejUYPKqx8fJIApYiQYhNtZ3e0QxB8goCigjVwyb6
         DqVM7m6NkucSTFh7/mufgOdpWHSlyeI/gncpXGVURe0TOohmE4dPiOf+st7fhkC1muwE
         QJhAqCO76vQe1z7Gwmc2hFArbBQXoBoTWw4kdoZcdl4y12Nkffr2tOAOMAw/w1zsd/9/
         PyajbJUBSM9+CY0lx7dk1i3nOUoFEgpi2ZMAW40Uz3ooIvbo0gvvebGXy9EnkI3COr1L
         0AlSUu8VinplcKuGRnRz26Q0pKTDFD0Fpal0mvL5Y2gxQ8eslau6VvbPgNomxqkHFHrc
         P3kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh1Z00D49P/5+u9nG7mxN5ICnd7p/j0072FseNWz5tAEKGSMhcyw9Bjdf3O9LpsoeYWvvg/VP3eHRP7MdPjiXd@vger.kernel.org
X-Gm-Message-State: AOJu0YwJjrlKFP4AbZPRI3mzmx1+PaHFglvLPGKv8HA7PVSOSQbFMGIU
	4CExy+8wFwy8+NggkEVic/AwM0rH9+jWS7KBE1PGWL2oy1co8YPyja+afHS5rb8Mvw==
X-Gm-Gg: AZuq6aL1jELGRw1+LuJGhSC3jC/nVel3PEX3v45bAnAyoSRPxMKVaLWcKRd0xAq5mCB
	rMQA36gMZuuC8cLvAxb3i+ci3hse1c9QNbObji+x08l66Y2xXj/0nfD8aTa/LPuevwGqKFvKXQh
	MnET7+yCLb0mbVJB1SwaFfDkWlhteVWyq+eSLEixMRFtzNs2cNvBD7mSxH+MYu8vlPRJ4uPoxdn
	imZoH5i6Mjiv4Xim49A65qDCrDkReb8UxUS8YjtMsR1vBDPJ9KLZueui0y3l8S6zs6cgM77GNIn
	CGPwM7+ihv1NK8xnUn9cZv0SqGF71RQ9PYWr4TXk8wasQ5Et3TWX+iDbJQZth4q5jER1GiRqFr2
	fuxhN9tFEi5hMeEfiHKUwA06UNQjG1G5kcTeK1/f76Y+a7EQ4pwE7I5PmCiHtV53Dzs4vbSwR8M
	vPjA3er7wSDCXE0feZa92hTtkMs9SvTUbMtBpcQ4lY8zzuyJTYt4q4EzlpeC0S8Mths7rtr1WbM
	8vaCACF1mY=
X-Received: by 2002:a05:7022:160a:b0:122:2f4:b251 with SMTP id a92af1059eb24-127397bf3femr5004979c88.21.1771265502576;
        Mon, 16 Feb 2026 10:11:42 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:41 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org
Subject: [PATCH v3 09/15] rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:46 -0800
Message-ID: <20260216100943.v3.9.I6973a32c3fcd6d2edebdd6fd868fe0a046420ed5@changeid>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
References: <20260216181002.3475421-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL messages, so the transition is
straightforward. We can remove the call to mbox_client_txdone(). The
call didn't do anything for NULL messages and it's now officially
documented not to be called for doorbells.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This driver is used on my sc7180-trogdor Chromebook. While I haven't
stress tested with it, I can confirm that the system boots normally to
UI and can suspend/resume with this patch in place.

(no changes since v1)

 drivers/rpmsg/qcom_glink_smem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 7a982c60a8dd..f2a6d94e72ea 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -197,8 +197,7 @@ static void glink_smem_tx_kick(struct qcom_glink_pipe *glink_pipe)
 	struct glink_smem_pipe *pipe = to_smem_pipe(glink_pipe);
 	struct qcom_glink_smem *smem = pipe->smem;
 
-	mbox_send_message(smem->mbox_chan, NULL);
-	mbox_client_txdone(smem->mbox_chan, 0);
+	mbox_ring_doorbell(smem->mbox_chan);
 }
 
 static irqreturn_t qcom_glink_smem_intr(int irq, void *data)
-- 
2.53.0.273.g2a3d683680-goog

