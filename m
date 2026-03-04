Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B293DEAC4
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Mar 2026 19:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772652267; cv=none; b=h0xtH94OhKp7ZL6VdP224MLdYhK8CggAYhkaSLYKqIhMXEe5Og2Oo+OwaZdHPIkveDm589pENLyU0DNuBHHhFcVaB1Ewd/ACVWEA/jsHK3Ie4Hp+QR7azsC7rEbwokUJyuIKRZrdMmh4FU1nhGjksUz4iYC67Hkv95Hh4bIS9TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772652267; c=relaxed/simple;
	bh=6ei+Huwh4PKhOxKolosUs5btGNjYQcybQcHfUM+2gg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OKtGVjzLza8/pr/4PGE9MZ70gQCXGBIPsjBL5a7JxchrCCMpjSi/iaRm/Ojgm5e2z5nzUuk0+SJ1OGWtvjwwQaPPs2pTWKSlc0O7xyjffNsLRrIL1flH/t3dtNoYq1pPXBkEIST9JWxfP1iybBAeGeI1BloAyVPAZ4nmaMhUSyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCYms1KM; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCYms1KM"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d55b97f358so5790277a34.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2026 11:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772652265; x=1773257065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fphkXrW0oEd5iFF9aoqhAXkr62Eqyv7ZOBulCkksYyw=;
        b=aCYms1KMm6GLVKucopsbzahvzXyQLOFUYtjFkjkmIkDtURSIhd09IgKwul3pyz2XQd
         poZSXR7G8Y3CavAaICLtFPr3KLmttlCMwJt2MDg9pqVagTQ25IyidxM0JoHDoNWc2T6d
         gPZX7HmtVWlCUdyTbiJWv63pnaQ6+Ol4bZ7eBewWHnBJTRXD47KS9n0ShHjAsYoYkgfX
         y6lqV8jJoDWpaAuh+m5Ilj6BvrRK0s7IUKTQ/t1MNcr/vVBFNKh9MF2lEAwwPsDcCKvA
         uypiIC6+0ST9LvYDhNDAjNBeFvS/vBwRdddI5nAVUz7Ok+P4qRTIM4btWxBP7WbuZofa
         dWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652265; x=1773257065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fphkXrW0oEd5iFF9aoqhAXkr62Eqyv7ZOBulCkksYyw=;
        b=wcB+AE4pUnBjut4jpRqIziAqq54UyA5rZpXgJ3bclJU+zz1nMBdmovD9NYANaLZRyK
         Pfe23xrgfhYvuc5/Uxpy3Rpj0XYHcOt1yWRlx2FpooppUR3hBWtiz1Ck8ThuMc8rH0Az
         VRvVpBfau4X+lT08Vqwj71R7g9P0puiRU11jQVxm2aomUyCBz2ktUX5YuPzaze1Edvmx
         dnCH5BeBAeskCIKn+jv1BCsEUbJBBOeufK2Bad4R/uj6C2fTsZb+e7IOOe1CHXoRIJD7
         IeHR9ctM9EaSQgz9GaNTRkKx8c/Fnm4pSMx+1W6a4o0QOWqRv4xdrdURgqbuzJzTxBiH
         CeNA==
X-Forwarded-Encrypted: i=1; AJvYcCXwySMjcJkPKRD8DRD14GxsTdwXvfpTFoAW+oW/jOOisw19Esc5koBGxgXNP0NsBU2XZF1V2WFOt+5Xj1OS0JO1@vger.kernel.org
X-Gm-Message-State: AOJu0YyJTWSaQWADp+g3ETpW4tl1MKzuwyJNy+UHhEB8uiqGFRtgnMxK
	pcweaaWj7xuRdaV76OiZTgsn0gnhsLdr2GJcVcv+FCQpgimzYdWQQeCo
X-Gm-Gg: ATEYQzy9gpU0JSs1qkNO4N5a/Jye+lVfFIYIxJ4rEdFWmhArfwq8BSYdn7zn3rknVLb
	lSfXlkQLN1yxrlaH8AkJIvwllqCxYmeJN8o87F3NkUesx4zhMcqzvHLtLR79cpY6Kivt1F/bX4U
	rk90k2A55bQvwGuXShoL+UaelV2ucvpw4kMJ4svb2so2MdPFMKUTuSd1oR2vfT1XOifDUlifsCY
	FntkO6f3p+kxi3YLXBmFm8tugRZpEdNtSOxbDWTH9CbBepJaLU6LwFZCSlZIndHoMWSKUxqFZQm
	FZAfiuFtJq/FpP4G3xowmZaDnL09TKY6fzUTWRzdfyCibIdktZj1B7YyahdVQbwjH00oSalCTRZ
	xWAzhKNHi3zp87BRzX/lH/ooh/kzhrFhn7PBOe6G+P1xENpPtV+vlTOqPPdhb3R9w+Fdje0phJ8
	hUy9LHBMtaABRx08PBUl3SVTXrfaizR/aNnevcGSz5ZSNW2BwIy5qUp9J+JkgdFzguY4BRxm7IF
	6GZGRBTEbOVUvUnAIkovahPW+3GJu9eb58B/kpf7g==
X-Received: by 2002:a05:6820:208d:b0:676:d076:e4ce with SMTP id 006d021491bc7-67b1e903320mr1702204eaf.68.1772652265335;
        Wed, 04 Mar 2026 11:24:25 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:5b2b:e942:c11b:ed62])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d85297sm13294165eaf.11.2026.03.04.11.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:24:24 -0800 (PST)
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
Subject: [PATCH 3/3] dt-bindings: remoteproc: qcom,wcnss-pil: add WCN3610 compatible
Date: Wed,  4 Mar 2026 13:24:09 -0600
Message-ID: <20260304192409.927562-3-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304192409.927562-1-kerigancreighton@gmail.com>
References: <20260304192409.927562-1-kerigancreighton@gmail.com>
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

