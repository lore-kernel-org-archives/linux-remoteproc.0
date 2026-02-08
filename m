Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E612C11C6
	for <linux-remoteproc@vger.kernel.org>; Sun,  8 Feb 2026 04:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523471; cv=none; b=NVrc+SkKoaL6+kZ+nIOnR+X/azd7DbFKHwETRU1yB/c60njmjUC6nhvwIuBK7sGgxNVicAkRw/meHlUJp4VKp7mG/Qeg9tSV5w59U9+m/LJDO/8QH6RliMPsawViuNctG3X2dOmJo8SK5q9i+4aFz+w+tBRtK3gGMgly7rgyNts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523471; c=relaxed/simple;
	bh=Orbri32xHuv03gpzS9cVteJyifmJeQFoiQPoqhr6j3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhUl83MCZNKtp9yKvwV0N5bcJiUXYR35oCTn295wRLFKKY/gh2xYHG/P7yCW8GlUFBSbFzFQe5hP1xXJJU3uC+bzW2pABLR7nYDFn1Thcb41pDrCpo5S27GX+1fya/ypHvGGDrtEvau6DQI+MCapMc6YfAm+FsP6QkPqwtSHXZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dur/ZpZu; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dur/ZpZu"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-124a1b4dd40so6661594c88.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 07 Feb 2026 20:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523470; x=1771128270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyL5nxa/XcZnD8gJCLsBtvC6TjJ39RzGnqL0OD02oLA=;
        b=Dur/ZpZu/xLlOINpbgtdb0mJdPH1RNQFYiLpqTVxUlIH1wHWRTnNkAcEZw5XWF49WG
         RKJcB7pZ7HMX+q92sa8wts9P4w5uU9++bp4U/S6Lf0EueAr+FzZhN0LFy8Zi3Nuz5oeK
         S4jTWgqgXBdy+PaZKiao5HbW1d3eMn904MuvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523470; x=1771128270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VyL5nxa/XcZnD8gJCLsBtvC6TjJ39RzGnqL0OD02oLA=;
        b=f7WiudrT8juQuhpQWvAUW5ZEW03L7d4jxl+apxc4WuDfgbVpZ5gEmUvmNO7N7oIG2q
         sjpc/AVdsqJbQZOibbfzL3DQTxaH8uVbwRlDEAD3TdV3azB8msTJ9baXqseTOqk7mYAT
         u/kQJUfTeg6fPEVi/RYskHAu09vcBQ10nxfX5iD2SWJcnQr+yAOf2ZzEtfoOYTc69Y8o
         smnCNAxtnJptFMr6An5BKCwVQBQxmGOXIOxMNTD/MOK+3xhDSVdEPQ43UAqyMs70grrm
         UZjK4iNQaEyIc8ds/Fe/zLDaG5x24vHTV641eSy/Wtfetnjwm9R7X1Mt/mw5Jybop+zg
         Y6Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUMlofkwc7JXsu20exkyhYcWEV+nXRtQDVxaQYGrRzr0WEip4QFB1WReOPbKB+Is5/gZ3Zg3GApP/ar1kI3a4uk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqw5o28d1Ptvv8/ofQf/ovI5dGJlA0G4zFPNL0VJZR85qG98UK
	PgkGDa80JErFD8HDeT80C0FBXJUjhFbIz/D39AMkHle3S5LaA6j7modeizMjXae53A==
X-Gm-Gg: AZuq6aJ4P4ADFsIspWyqVjUwTx6Pfm+17gCytFwxo5Vicnk3hT7USavsmHXk4EvEBOf
	PTwJ8wBBY5JeqqIyjzWwNxLrX8noVkdBuDSBFlJqgyHfN77Hh36ygLGfKmFlebmAQiazfYhyoS4
	4mopeQpSfhIuae6uidoU0Q1o5e9xilhHuir/xELQm8yzJVCe7sYIsRKaAhJjsv/kfur/7TZEMEa
	15jdBPvt1miE508uyES+ARWVaQ0nJSzB34FiBw9Uzo+kypD8Fjt3x99t3t3NJTSeza7vwosKUKP
	MxfNIyNsbkF3nDdqKSMgaiIX1WLAl9BlXNjVC29PDCHU+i6Q53jqtal+3u5S5ttJVxQ2e0DjfA5
	PSrWM32vTShZfoT4FDeONOf1S6acuCu3ybx85TOGQlUZ4w9pTzMhVkwQZLYddMjLoT4WfI3XDwc
	G7x4PnxwvLmBlPhv5262wkN4gR5ODCzNRbk6Zb0dA+pc6T+FRb3+zM+O/07qag+8MbewG+c8Q=
X-Received: by 2002:a05:7022:6ba6:b0:11b:8161:5cfc with SMTP id a92af1059eb24-1270401e496mr4235997c88.36.1770523470198;
        Sat, 07 Feb 2026 20:04:30 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:28 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org
Subject: [PATCH v2 08/15] rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:30 -0800
Message-ID: <20260207200128.v2.8.I700ba93ec437db5100c0076941d8470344ea9995@changeid>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260208040240.1971442-1-dianders@chromium.org>
References: <20260208040240.1971442-1-dianders@chromium.org>
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

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/rpmsg/qcom_glink_rpm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_rpm.c b/drivers/rpmsg/qcom_glink_rpm.c
index e3ba2c63a5fc..4cb9c36adcd4 100644
--- a/drivers/rpmsg/qcom_glink_rpm.c
+++ b/drivers/rpmsg/qcom_glink_rpm.c
@@ -197,8 +197,7 @@ static void glink_rpm_tx_kick(struct qcom_glink_pipe *glink_pipe)
 	struct glink_rpm_pipe *pipe = to_rpm_pipe(glink_pipe);
 	struct glink_rpm *rpm = container_of(pipe, struct glink_rpm, tx_pipe);
 
-	mbox_send_message(rpm->mbox_chan, NULL);
-	mbox_client_txdone(rpm->mbox_chan, 0);
+	mbox_ring_doorbell(rpm->mbox_chan);
 }
 
 static irqreturn_t qcom_glink_rpm_intr(int irq, void *data)
-- 
2.53.0.rc2.204.g2597b5adb4-goog

