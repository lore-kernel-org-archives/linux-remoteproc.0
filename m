Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB4B288515
	for <linux-remoteproc@vger.kernel.org>; Sun,  8 Feb 2026 04:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523478; cv=none; b=AH7Jzqh41fY+yR3wBJ0vXLxALpQvo/g8CAdwBtgrcz3E/gbvrZ1ZZkTFrEDd+D8CCk61W8beffKb1PtZDkQ/o62/AsH7lMtgDRVN9DaMIk6ZZpVfT3fa1kji8LsGzNlUrmoxEZ1tW8gGXP3LQ/N+Pm5bHCD6MHVe99antVUUj+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523478; c=relaxed/simple;
	bh=SAIOYHmewH8+YpnZCmSgyUNdDUrB0z7/bJKOh98QEn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYsya1Nu6vG5kYlfcQSdmewm8Pn2kw5j/3VJxBADQZGIiBJIbQVUrSfibkccHkUGSRnr+fXqiMMRGScsmoFcwvw/s2RFWgn4b92HYiLcQQRg6bVag82/94Gwqt6YJ6qvf6h0Y/u23GaTwAFCTMhDgmHpvJJNUpw7SwuFFXrfeP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cj3qW0yz; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cj3qW0yz"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba6aa57d5fso105737eec.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 07 Feb 2026 20:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523477; x=1771128277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rhq2fvDAB+z0+8+dqvd5EVUWoDgUFedDXtHNQ2aZ3r8=;
        b=Cj3qW0yzM0kMFj7sHk2DuAmK/FBfwUDIrELDp3q5Pedyt6x9lC81zMsAJXBkiXTmc7
         QmDEyVqdLqDb8yxHFi7n/3fhMMdPj7EylK3EXgySiFLOJECiTZ4qCWz6EnAXEOQ8pEwN
         Syv5+CFuMSTJMx43yaHKCTOWJoM2X+ut8+KGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523477; x=1771128277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rhq2fvDAB+z0+8+dqvd5EVUWoDgUFedDXtHNQ2aZ3r8=;
        b=Q/+Inp0ANLHUrXKSoRoPkn3ijCcl800v3ColSDSbYhqR1DOHxL2+nzjDorjbq6hWp2
         Zij32yPaInFaxwdqkYLhYxHvp7TdRMya7nY1T3gfhMFPbqm4VTXYvzcf3SEQ3VoI/9Mg
         bjt1IMHgNESqMCxBFbfPOuv6ll2o2FOXfyYZKprvQD/ipuvsPs+OpqBbg4NBbLExXJWI
         Lkg4YLWY88RhWMLsBmWxRCa2hLzBYMhyv3mhK4PPrMslVLmQrFvAy5Vo3kP3TIgbvsG2
         rkCsjpIYkL+YVBY4XRuVpVB2Ar7dJyQZrpe5s618mSGEvoapv6MHghWQwJMTQr+Eyg3Z
         gMYA==
X-Forwarded-Encrypted: i=1; AJvYcCUf6E/NJCu/5TzY2bUIZLv4Qu5SasnU7/sOehRoWIfbLkRFjw7umnR8GTEjmtwPJglSFSCIDXsIjgJTuq8bdAJV@vger.kernel.org
X-Gm-Message-State: AOJu0YwLl52Jp8ntE2rQaP4Ww0cgqJCXG0H0sFcXXxkGBr8x9VFI7sX1
	qQEf3Kn2GqONmACU7VMQE3rFDF2ebAn/OBnpY9QF1oD294lfALpERoLk+ghp7V1T4w==
X-Gm-Gg: AZuq6aL7b99I3pkBwaHYpplgd26x1WUJlTUjAZzJ4LzQxXayTu6DepHT4MVQ8RYu3zp
	9hqzkoB7T9p4Wt0Aq954aEfJKYBD35uR3U8f0asZVpjnXOExg2PaaHvwSZk2w2c1Cv5MYY8d1Kz
	m/T69YoXAKFV3sFqy2ZijLibA1T4UAcYz/AnhK2GHTJFjGiIcFBkdxl3MYNV3Gl6K/xfNTsu3Ye
	cqkLjsTdnY/ur1KID9FNloC6zuPBtXTPJ4eyi1NJDyQf/gOO+FnJVJE2yQPzHdf7hBwBoThpWd+
	iMRX38xmVZPLj7/2GZxlYoxubaM1TEAvQEKBhPUfRp7BcLirW6tdZ+dObCChZgrM9bds4CmkRtu
	ZHkIiGNl741eAw1lC0WkOy2XL8XH+jjsynXpARn4vDwqJ/Iwi92pbp63YiHruG5JCxSeW9ofwuV
	ehwbAzothgcvyCR0I9hI6BX1mzsEd6iUUeWQEFBQkLLZYUaMIWu1bcYN6iwSA6+1BBVM0G64Y=
X-Received: by 2002:a05:7301:38a6:b0:2b8:209d:5983 with SMTP id 5a478bee46e88-2b856833715mr2948032eec.29.1770523476783;
        Sat, 07 Feb 2026 20:04:36 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:35 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org
Subject: [PATCH v2 10/15] rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:32 -0800
Message-ID: <20260207200128.v2.10.Idbe327f5b4ce65a284b55033627d0819e2fed21b@changeid>
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

Also remove the comment about the only cause of errors for
mbox_send_message() being if the framework's FIFO was full since we
don't queue doorbells.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/rpmsg/qcom_smd.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 42594f5ee438..afe1177d092e 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -371,17 +371,10 @@ static void qcom_smd_signal_channel(struct qcom_smd_channel *channel)
 {
 	struct qcom_smd_edge *edge = channel->edge;
 
-	if (edge->mbox_chan) {
-		/*
-		 * We can ignore a failing mbox_send_message() as the only
-		 * possible cause is that the FIFO in the framework is full of
-		 * other writes to the same bit.
-		 */
-		mbox_send_message(edge->mbox_chan, NULL);
-		mbox_client_txdone(edge->mbox_chan, 0);
-	} else {
+	if (edge->mbox_chan)
+		mbox_ring_doorbell(edge->mbox_chan);
+	else
 		regmap_write(edge->ipc_regmap, edge->ipc_offset, BIT(edge->ipc_bit));
-	}
 }
 
 /*
-- 
2.53.0.rc2.204.g2597b5adb4-goog

