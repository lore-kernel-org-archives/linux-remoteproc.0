Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0F22E2852
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Feb 2026 18:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265499; cv=none; b=MaXXASxbXszl/5Tajf5xQ0FnnyJmW6z31SOm93vitV72Z837lvdh8SuRBUeTs9WLhbNaHC2MKAoLD2F0UhB1+qsc33DaeG8QBuHyUopVHFw11QWxrSxUhnqdbkLr7oZEohlChTCCnCzjy00uGCjKh08gpNT4bXcBNT6oe2y8qzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265499; c=relaxed/simple;
	bh=qHw6/cUBET4o0ltmrD98jP1CI2iuzHCbQEtnw3D5i+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQUJuzYysaeY6SbsS3Fkqq0q73xFzcpcBjpSfF7RZODLhdHlezHYLD/GcUzGLGuW29LXX6qn0xxin3rtyFHi03XckapKqHPG/ClvFR0hm3MGt64JJI4Bs1RdYiGqOH/POUwZDKSN7K7KEcIu1TWhyVvJbKzWo/HEwV0fi1n2aWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hu2enBbp; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hu2enBbp"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1270adc5121so4506843c88.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Feb 2026 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265498; x=1771870298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Db07UTz9RXOWj1h4w1Ee5LGFVrVZHwXTeMkkamvRfPQ=;
        b=Hu2enBbpqvuxutTyJ7UPT6fhbONKI+O7DMUa/O35YMzGicxfZkT66b7mudtgJeb/K0
         F+KGY4fzdWC31NwqMa5a9XWsMnR9l7kiVXp2XYvrN7pLKIwypixTfmMK2uRDJDL5QerU
         ZcIlxT1RH5Az2TQA++Hr6F5A6wT0R8dT7IMS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265498; x=1771870298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Db07UTz9RXOWj1h4w1Ee5LGFVrVZHwXTeMkkamvRfPQ=;
        b=Ppkc0oZNs5phRVrbOUOb7nQ0LNs3iXkNGoB5FLWRE+Ds8aaLtrX+96HJaBJWWQyZHE
         gzpMIHiLua8BXj6OOs4GwVX9ciVlEEczM10CIqKTXQWbnqDJNM3wHNtVLOxDswQvYUpY
         arV6bY87piMjuMNNaliD0A1o1Ypyle65TccHmamdVlzX9F2zps7C5dW48ZToxjMGZGU8
         6IAu/9RT32Htv1ueOKLYeN9ReUFJvOcYoq2lLkMOQ6wD8+Ggn+4xfWQAn8nDnCQW3is2
         /wpxgLE3O0rV8ahiAZsdZsYVagwrX0rNUNOoa6l7176MdXzbuyN2A97QqlHr3DsSj4fg
         4rCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmgajaqNPaUWAqxe8RdXq/AJ99RfX5JUnSVS+QY4UUe/4oIq5pwtSNBEIN2VHQgQ+8z/XD3ek40yQGHrXXBrO8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrg3hkwrUBCsAJr88SNaieMVqo7nyM7Qi1zRjaeg080O1KKMf3
	kBqD9VaqNi27xHyrTOjzpkrtUhquaftPNfKczzCdWwt1gmIH60W7RAnYxFgUoc6NrA==
X-Gm-Gg: AZuq6aJ7xbZz3OQqTH/Zw5tNijj0gLKRREY/j3bDDBShSaYdHrEtagAqSgmmnprpVgC
	v669CK+QxFl3HcQBiwqPRnDNpFYcCianuXrhs8Z8Eo5GOkc6ZTzuESBMHnziCsaG0i6RhJtoabG
	S2ud0PDpDHhgfgkueUY3uqkex7JtOCCbTdngrHjTZKr9yaGAe8bxAMh7hu2lQxIO45gLKBIDHj/
	HShFrht0Y6OIO6rAj69xUbJfd0hgZdw2bE474Q02RHoNL5aqWqlaJCEvlc9OwrAEUmukH6/mgYt
	/mXNQKtCzDPWBObzonPVba4NJSxhXGS/7TJlhNcgAuadwPFSwrNnZIn4GQhGhgNMj4O3Izg6JSC
	wVpTjR9FgzyH81dhW8Vuak0/EQOnm8bxlu5/g3vWorJMZNGLW2FUXmAj24B4Iips+T0oTcxfoQX
	R9dfGjDgZ7706KmgsFwz+ZOGa3IHt54vBlMpYUAkwMxqGT+HqWSgFBJaNDxUmfS4YM3Ktignqwv
	n8xX0rClFg=
X-Received: by 2002:a05:7022:2486:b0:11b:2138:4758 with SMTP id a92af1059eb24-1273ae182fdmr4743681c88.21.1771265497580;
        Mon, 16 Feb 2026 10:11:37 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:35 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org
Subject: [PATCH v3 07/15] remoteproc: xlnx: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:44 -0800
Message-ID: <20260216100943.v3.7.I90e87b8f7d6ddccfa0372bb96d196d2d9d7685db@changeid>
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

This client only ever sent NULL message on the rx channel, so the
transition is straightforward.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/remoteproc/xlnx_r5_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index bd619a6c42aa..2acdc536d6b6 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -245,7 +245,7 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
 	memcpy(buf_msg->data, ipi_msg->data, len);
 
 	/* received and processed interrupt ack */
-	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
+	if (mbox_ring_doorbell(ipi->rx_chan) < 0)
 		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
 
 	schedule_work(&ipi->mbox_work);
-- 
2.53.0.273.g2a3d683680-goog

