Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453612AD05
	for <linux-remoteproc@vger.kernel.org>; Mon,  7 Oct 2024 04:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728276762; cv=none; b=NbLmPdTdW/jNSNEW26iPuNbe6nC8p4Y51L9bOy1LTaMEEIxA7+xGGf+rmMJw5NFlGJTb+EcUasOEc3TbwAiLBFzZ8j+jKiw2ktkZGLyfTG4AcAAclDCDJ7IOFjozBabIo2UpMRuFSZG+0vZ8MpYI6qV0nCbHf0Z1MmBoRdN7Oxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728276762; c=relaxed/simple;
	bh=Pe51Lg/PsZLWAqG9WRRKbxZ4v4+EdZ8UaY5o4W06xTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rBSAT+4O1mBsRJbgF32CdqxuFcwbESFxVGtyu+7ZV4vymPFtG0+OFfiPTX/DjQr8xiZPNL3ujFWg3G3sxJxUXPKw3qH5RCRsLctO/IxNOMwFvupUTO5uGhEr2N9XRPkl1W06yvfDWeG9myTwjtOAkyyg4S7L4ly2XlgkU4Betks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=f7PKCYpE; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="f7PKCYpE"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-45821eb62daso26671391cf.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 06 Oct 2024 21:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728276759; x=1728881559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0JH+eeGvKfz71oS0W6AeXi5f58Oy8T9dmTdRTdFrBnI=;
        b=f7PKCYpEyASYIm9Zx+2bSByq6wqn8r12rCjhHOb503a9RR7oTvEhPCgd9XrZ60DNdW
         +jxhl9mtpI6ONwPRk6yjUrG1G4s7Tdvc0HnpRfPtFwgWBOSA23eZuXHwnRvZTrkQWIJj
         i3U8OxSkCSAjgsUsp5BvaCpNGnQTGM5Tf9baUcYhc8bwYOhvl/KEzYJ0h1KzfHCb+iCF
         A41ROm9rqwDxTaKU+WHRjjaKiq6NQ16kDhveIb+i4RDk/CiB/bKPdnjXj4uDhLw8VYqp
         S+f6+hby1hSaLzvG4Z5x3JC5t2mehY5NzQSOe3Ky61aYPrX2+SLEM+zxLo+sFNtITZep
         kH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728276759; x=1728881559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JH+eeGvKfz71oS0W6AeXi5f58Oy8T9dmTdRTdFrBnI=;
        b=o1EKMLVAJ/6z53yKStYumb5i2M0MzSXRJJ215T/HthoReKmTUf2IH3xji5v9+KjXkg
         N61h+eEHokcdNk1RfPTfRctPIIaSDR/fBQFfbZWeDdHD9r2oAKXmCG+mdEqfcpXVNR9E
         cemLJW3FngI/8ucXikyf8zJeN9jUsIErusk2f4QdHitfuRBE6o0iEdwgyy5wxolChcna
         ftJT5J9ZchCPlmfXabhDB5G7RFJInuYc9IiAtYifF4cNtfUZcYu9PjfdcvEJFQ6Gto4P
         XuM9ib4t9i3mP1YBTfSf7oX7+JBwImBIgynsbLNMn+Hmn+MLwSz6hiiq2td+3zzZ5kht
         FAbw==
X-Forwarded-Encrypted: i=1; AJvYcCVReFKXZ80yTfVqnYr++OCFCk8R4UNRaJsNCigTYgWc+kE7wdTC8N5iuIzWr/heWg+540+zeipfkrDyTwAMC9iQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwGRd84LAGFNckhUYSbSbfkYFgVpt7uAvaFxe+63E4FhN+GSbJF
	L5OtRlkTRyk6gM0AqJC5L04zJbcoKdqtSDj3/X5Fa3pt0BSbzBCnPar6dqFmFkU=
X-Google-Smtp-Source: AGHT+IH/9bsZq7uHy78secXuJvI/6P0sWacsBbySahkLVEBVoPJhgQSm4YakQO1cbX3fBAenHpNq8g==
X-Received: by 2002:a05:622a:450:b0:45d:5d31:89f0 with SMTP id d75a77b69052e-45d9ba2f03dmr192178031cf.3.1728276759124;
        Sun, 06 Oct 2024 21:52:39 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45da764043esm22666351cf.88.2024.10.06.21.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 21:52:38 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Arun Kumar Neelakantam <quic_aneela@quicinc.com>,
	linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] rpmsg: glink: use only lower 16-bits of param2 for CMD_OPEN name length
Date: Mon,  7 Oct 2024 00:47:22 -0400
Message-ID: <20241007044723.25347-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name len field of the CMD_OPEN packet is only 16-bits and the upper
16-bits of "param2" are a different field, which can be nonzero in certain
situations, and CMD_OPEN packets can be unexpectedly dropped because of
this.

Fix this by masking out the upper 16 bits of param2.

(the commit in this Fixes tag is not where the original code was introduced
but it should be far back enough not to matter)

Fixes: 835764ddd9af ("rpmsg: glink: Move the common glink protocol implementation to glink_native.c")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/rpmsg/qcom_glink_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 0b2f290069080..e4933b823238c 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1204,7 +1204,7 @@ void qcom_glink_native_rx(struct qcom_glink *glink)
 			ret = qcom_glink_rx_open_ack(glink, param1);
 			break;
 		case GLINK_CMD_OPEN:
-			ret = qcom_glink_rx_defer(glink, param2);
+			ret = qcom_glink_rx_defer(glink, param2 & 0xffff);
 			break;
 		case GLINK_CMD_TX_DATA:
 		case GLINK_CMD_TX_DATA_CONT:
-- 
2.45.1

