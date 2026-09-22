Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2B637F33D
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 01:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042294; cv=none; b=NcTlJpO6alYSRm0FNAIAzEBqgTEbJ8CQSnSVFDs33CJoVPeuwSfDqjnVIa7wsALJSr0xjCZrclCu6mIig79VzuhP0TxcL02Ecg8YeDHSzYCOtmLiVRHjLzNdqkGJwPgBj4YeioAdX9mFcP0FFQ7XiGa7ZpH3bBlwU3/FgU1BpG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042294; c=relaxed/simple;
	bh=R8K11s0BndL6LE0ql5BRGc7vujvck+7Af7FsCOsZG98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCwD72mY3rWtH2QHhI/vnfOCtPOanN3M0Ky2Mo7RemSbCFzz12tYARb9+7SIuHf2MOOJAQoa1hLoD1vb2pgn9CwY7egzdCg8WgHX/LDsw8ILZ3EH4SWu3c3/PNK8j6K33oQT+ePo5xTvL2qlnNAUfAKYTAJrEgANZROtpJtCATk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsIUay0g; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsIUay0g"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-939eb3249c1so302297685a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 18:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042292; x=1790647092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdHhQQ9Rh/yme+QeCJrihS365SLLVixpmNHdxOf0vqk=;
        b=qsIUay0gORzqajTzlYbEE664AD+a1BN98rH9nEYFjFojy8vgmUBMVKHw9TFQF0PxXp
         fEO6jEpKOxwN5yZv4cer2u9+T/hOnD+onpUipqTejr/GNHqk2pk4wHRc7PXqcHbeA3Z1
         QzOzcoUl6ZkBmaxY5CnGYSyu2o2aFOs4pgzjKBZd2sWASJzMgcb7h2DO2pQXQJF55tjN
         ZtF933QNDQM+NwCAdcK9YTDeqpqElPl785HIdzbhbdKp1pGiC+3OTU6OcjorCq6TdhfS
         O0J7FgsgcB7TGEyrKnZbXmva0xpbK9ga7LVq6zC370TgTVi8Xs54YvY2zduUg7/PTzcc
         STeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042292; x=1790647092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SdHhQQ9Rh/yme+QeCJrihS365SLLVixpmNHdxOf0vqk=;
        b=UP/Pm1Y43vd+TvwvXnXbKANMe7kc/RqZMVHewo5iG08Xik/89a9+RD9s4SfdxwpI3F
         VfrwHdqV5v6HVL4PXWoWodqYmB7KgYhNLuruulEvHUKIxqZwSJxutHk8xU+g8BvxZGwX
         O4eNtCH9FEptqkMHZnvY2FtmkGs84PMi6gsB2eV3+TRZfWTiP5mGMaXYpC16R7rT+lc3
         wx3qBPeewNIq+SJfu/25JRXd1qxjo36zCYuC8T/ZGGk24DMwjWy3nK5J2Li8331irlLC
         jqK4N3KEfhnxqLEWdCqlwE6d4Br29JBlMybdku6OHtmD4VwqTusfe15wQUXDg7t5LOIq
         s9qg==
X-Forwarded-Encrypted: i=1; AKwUvBxAMLBTkVBFyaIRbufnRNue0FKWyfWAWB13OGPbMhQzr/w5BuebVVTnDKQfKMh8z6sECPltijZ83L7aTT87H+Bf@vger.kernel.org
X-Gm-Message-State: AFuF++lgcVqyjCTiZHODGEpIT7VnEG8qoIFWX7cp1MeAYolLxXTY6oJP
	7QduDa3oAd/kcQznbveiyvwv/h/qWuojqfTnbOqD7FEaL6IADN5ARnPb
X-Gm-Gg: AYBFou3AO2uxf2SuHodGAR4X511V6nIFsiFOtsR08M2rMnsLshh2agzHoTHj10R8f03
	Wt8M4aKz+cpAZZwm/yWvuYHAOto6uRDmFLs45HXtU1HK0HvTAONkipbk8HJ7KKNBgIGyd+vxZic
	/Wlifel72eo7TKOoODPPEM7D2dKaNhZD9S41Rm0VpxbUXcg2jHOip6vfzv8D62bPKYJJwX2VXt/
	LSfUBF7HUxGHZfJOxGlHwOlXoqjaA9xRmUeDTz6DO0xCziRqEFhDj55eSFAfSlZz2WUXZDt9Rsz
	Ef+lCGzZl47P0mUxwK8dImngz1Gr9yZ4fR+UzYVIHaFeB4yN96uTE6QgPdmS8xFFHgIZ5DXriM5
	xqnzmyByr0pQqeiRuqRs18L2CRuy+hsmeczrPfFFRb3xU5AHZIXhqxjSc/SvTmO7+Cp+/ls5/p/
	QmC01q7ieMl+nwN6OD7J517azqbCHB23sAonVpxkvC54gJrBA6vGNv44I6KNUPDILJmQwTJWi/i
	Q==
X-Received: by 2002:a05:620a:4412:b0:939:46d7:4b4e with SMTP id af79cd13be357-93c15d76553mr341481085a.7.1790042292116;
        Mon, 21 Sep 2026 18:58:12 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d19ff89sm16781885a.24.2026.09.21.18.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:11 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 04/11] dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
Date: Mon, 21 Sep 2026 21:57:54 -0400
Message-ID: <20260922015801.32373-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the Audio DSP on SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 7e8ecae8e6cb..f0f6fe1f560b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,msm8998-slpi-pas
       - qcom,sdm660-adsp-pas
       - qcom,sdm660-cdsp-pas
+      - qcom,sdm670-adsp-pas
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
       - qcom,sdm845-slpi-pas
-- 
2.55.0

