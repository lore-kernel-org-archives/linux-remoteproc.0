Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7011DE887
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Mar 2026 00:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670811; cv=none; b=QiQ6bj382/Jgq7Egoz4iyWqr+EsULFEvkDMDZ4KLj6zYw3tJZm0R1o2QOb7Bbyl/mPqV6b69pzvI0nSi56Z2kjlNQ2gaQB2zAaN23y9jvHJmrS1X2UrPYK662Q8GNFCoSul7dSWXSVvsuflN3asWL4yvuSBTcPM90YnuUQjRZ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670811; c=relaxed/simple;
	bh=sNoUdxnKeLRM+2caoT7p7YZBgyoQATSkzyG0/fc18xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8tBLsWo3yO1CbYrvx28Dcq2DL3EsdgWwHyW+HfNb6nurQ09xFd4y3TXWqgcb05OjDxe59h2uB4CSJpq+GTbCUgv2gB3XtESsD3jT61lfqN5FqUs2iWvXWB24E9+H/sO6mM1yTu/x67uh+MmM+kZMhCnaUQYuMaT4i0pJW5Qdbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7mebY2x; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7mebY2x"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d4c3896e32so4216448a34.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2026 16:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772670809; x=1773275609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyyY/6iGZZjBC2RyXoGvRk3mOb2L5V65kz2wmEzA5hs=;
        b=A7mebY2xhqZFx1wR192sAQFmo0+zRAlPeJApUDFnyrk7IPe6gQ8amTgXVYhIBdQazi
         DzN8/Th0sjYYj4E3u91UJyN0C1BCE1Ou6M+5UWtsQ2MhSK2Upk0OGT9sNSOz1A9LylM6
         tTKt4nHQN8yhppIrh+smGSp0QtB5clO+y3+6X4LXZq0av9uT6xy8g59CTNpzbfdQfWR+
         f7vPDTKEwPpLZrFJ0sE80AQThuv28hGnwlpkoiiqz95X0/ieajgXVtY3ERRL/q/WBq9p
         Ezs0kXEJDQReyXZMPgc+ro7JAYXFDLa1UHGrQzdDcqYKPp11i7iajSx1S9ce/k99CRMw
         g7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772670809; x=1773275609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PyyY/6iGZZjBC2RyXoGvRk3mOb2L5V65kz2wmEzA5hs=;
        b=JF2UaX/qmSQXDbMedIyCVXoBv76N/yrWrOl2qxVojVLATvjdOZlkDFMkoipgQlWybh
         8+czn9kiOGIRBk0BsC/ABogU1u2c7g54WWm2PmzNMi1PDYvzEhW9vuBCGbXcC2p8v/MK
         7mXy1fT+ardsjZQ7GThQ3P5rYgOWIA7DJ+4QcRvj3QiExjEZOMSgmS4UmhPwy0y5e68S
         UvTQ+sOYSmePk4pfFg0AhfYGqmg/DWTcUbZOaJrOLIiPGEku0udOut/7qZ9lNqVWf80q
         9v1jdLAVOCG/vy3nFDtMyCY4qbSeme7wB/thyKxCXUWv/2ujlt5Ld2HKNqw/F0bhnyNa
         /ypA==
X-Forwarded-Encrypted: i=1; AJvYcCVMdT/ODftaP060jBnNzUDjAqEuGzY26SzfHLGcjK7MdWn9/9dNQjO35JixlXWApdrVwzTaqR3C5az/mKoCzT8I@vger.kernel.org
X-Gm-Message-State: AOJu0YzerOF4joaYr7X/cjtvv5pnCJ5E+tAyDEdsWtfTzERdNw3SJoCM
	9RGdmab1/XY7P9nZ/AoYOCY1Gw4wOt0HUAdSp3uNlZjQIC+nMBV5wXSF
X-Gm-Gg: ATEYQzzGWzc7E7K4Ko4VfyWEB36gIYc1GT9uN5FeY1/oYdAcgqdmkOYKVVF+HArN8gm
	BlL9ahaDrtDRykUKUAU2aAIrABTJ1UedE9kzlqiOlvSqA4tozrQuNQ7VCwdhOxe9P2w9S9nWn7H
	H6/cPpHB6tG9WYmBeSXzL8HbWG0UTIT83d03SsCRBwOjPVGr4Opg4lwLRGc7cQMT8uuTyiMN2n3
	xLaEwWerU3v+Vn6xJBo1hjFvlx9Z1BUdEBL7Ad9qzfaTxmJCA0hZSYcl8ZrNcT8nmRmpnGNvjnr
	sXLYbtw0/RJa2MZ6QCVLdzSHZxZMPEtg67LHTZ5kLGOSMnR2ptMjLTWzqzN4Apa3U03MhiX14kF
	NkSnRFq8RYUrFgNwPHCUC6PZEQYO9qpGp6nAEX9TEeM0WtY4o+mvTx33S+mQn6YoRtOpwLBMUW1
	DrScvGAez9QNstjeUisX40/+v8Cwm7d9pKk42MV/7q9dz0pVXUjmFll1Wiu8i5qu7k/ERSQEFG1
	XtwfnpeT/EeeEZw6ztH3eWTkP1smHIRDNHvvh+oTw==
X-Received: by 2002:a05:6830:2112:b0:7c7:58e9:8e16 with SMTP id 46e09a7af769-7d6d1253d7dmr2441794a34.14.1772670808874;
        Wed, 04 Mar 2026 16:33:28 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:2aa4:4aff:fed7:9b19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58644dd17sm16633834a34.5.2026.03.04.16.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:33:28 -0800 (PST)
From: Kerigan Creighton <kerigancreighton@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kerigan Creighton <kerigancreighton@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,wcnss-pil: add WCN3610 compatible
Date: Wed,  4 Mar 2026 18:32:51 -0600
Message-ID: <20260305003253.1022386-2-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305003253.1022386-1-kerigancreighton@gmail.com>
References: <20260305003253.1022386-1-kerigancreighton@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the qcom,wcn3610 compatible string for use with
the qcom_wcnss_iris remoteproc driver.

Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
---
Changes in v2:
 - Move the Documentation patch to the beginning of the patch set.
---
 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
index 117fb4d0c4..018cdf5177 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
@@ -109,6 +109,7 @@ properties:
     properties:
       compatible:
         enum:
+          - qcom,wcn3610
           - qcom,wcn3620
           - qcom,wcn3660
           - qcom,wcn3660b
-- 
2.53.0

