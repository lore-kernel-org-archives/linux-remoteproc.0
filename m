Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018331;
	b=poaBFP2E9hY8rsWg9OfUfzwPC1x8mi33s8W1IX7S/NgQPnCauIWpkCml+DQ98lo7cjOD
	 Z1tCeFMLea00BFCt21zLfiQJnND8ck16wd9U5GwGCul9M+Yffo1LehMUOUw/TFadk2mwH
	 4MwEg/a8JalUQeZGeneBOehabdNJg8/XhtcKmlcypTBRgXat3/6sgHGf6bg/NQa7pNFAH
	 /803JJ8uQyzP9TZiNEgkNF3hNiNPAvrA/AYNTbH+b1eJHXevhYadzQXkc7GiE3jbXzO/T
	 jcrOdkdCYiJftZjYNuXKdVlFEhMXi3xfjf5Fo2twp86nrGuiVHhK+znCm8iT8NIw9xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PRtH9+Dr1O28KhdhtyeoAvx+v54Z/fQlp9sOxD2ElWE=;
	b=aCGLUkmkFMqgOZUviKR0lkfjmi5C6mlMYx1dWRYvtrQQXHGXjLmJQcYFNBbc2AU6nKTp
	 aL75RtVqUZQ/E3dzEUeevjq1NhnmrfZhK/kE2doVDb43TA6se/DYuPW6NUf5kysOebud/
	 U7yZQuuPiXZCOEJK8rYDNmANo4lZvEgGXaq2XgqErMyqlU0g2dkTawVRAr0oTnYmRqi2F
	 vIZqD81zNJ5mqihYAwxhhahzPnFlNQUD/35ZtwdPQaTU36tKoTOUNriijGYQahZ8Zf2H7
	 M4QeWPEoa1wwuiqQ4UomDgYZemUmLvZoySPMfIPTEPV2CauhMuq/1oB8lluy2kmmNaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc4WZjrX;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828E6606A330
	for <linux-remoteproc@vger.kernel.org>; Sat,  7 Nov 2026 02:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 828E6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc4WZjrX
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99075306daaso636662241.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 18:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018330; x=1794623130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRtH9+Dr1O28KhdhtyeoAvx+v54Z/fQlp9sOxD2ElWE=;
        b=Oc4WZjrXevsZ4OTMfIbbyREOaA5y75WYe0/yqmZCTkQey/yR7vtBVeaPl8GxR1UyIi
         iJpHqhmI5aEStHLhYKg1qdE+XYRcR9gCBlx8ZK12Q21r/xhqMwNPUkHVas8ykMJXgA4p
         T88e7YXb1lKhV35J7diCLhvOic5PzFVmXBeB2jwie02oSr429h7R6Uq6nZTG6kcYUTRY
         zjSl/cq41vFYP+VNnZrzgdaF4neWIOFOJAV2PlEtp4wIfvhw7snMOAk55z6PIcwa2siO
         QI9aRrgg4svcH/B5udGBftoTLj6s9lAJeh5CHpXdmxWQqtnk91M9VMpWN6I6PoSd82Rr
         R4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018330; x=1794623130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PRtH9+Dr1O28KhdhtyeoAvx+v54Z/fQlp9sOxD2ElWE=;
        b=df+SKM+8iZzHw/oJ26WfbXx//SJu8Eige9LBhGn+m5e3ZcreqcwyenWZRXng4JV5/4
         XcRmHeZEX33CBDMxEJWo7jqyLrDz5KGm0lfEnLLEDHWzs99rhnu14+gpgA1b9R7b7HJW
         cGSZ3j6rsmkVdbDYMMxA23thLoU9bZOghUTvy2bkMF1/qpxHt/+ET0Bs5g7ae/MbARrP
         ZNKMAI4u580MVkX1+qeJGtnx7a0gPOk26jrYuwesoW6uJkV4YIEk+Dkx9BzygxGMuGe1
         /WCeFVfydEjNzTxXkSjEAC5o/1OosYTYHucb47mQmRjc57WmtJGQd1u4YQUudwQ0ToFd
         1bag==
X-Forwarded-Encrypted: i=1; AL+hErEGsy8+Tz5zd5brflwkpJqyNjGYdpKPfL6iO3loHzUujM5C8NPmUHyCIXs89B80NyueZ4FOT8EkNGDsYicXdgS8@vger.kernel.org
X-Gm-Message-State: APuU4Z+jZ/xIScEzTDLB2vc2cLpBNTMasq5252xHVjfxm+HmpgARly4H
	MfQ+kRYa1CrkZIQ3tDc7DAJ3neiWcP3sDyBE20eI2yybANJkQPfvwILk
X-Gm-Gg: AYBFou33BLwVjo9Jl+FXK38Q0EzIqEypL4qR15SeaWOGmVtUyV8u3OlLWGGtVoZgZk6
	WfibV0qTRenNk8gmVkx+Jf//CaYzZHobCwcjE8b7+Zw9NeCvA5y0xau4R1DCRtRV4vIMSyDSElJ
	ZTVk07U1jCoPp1nFNX+4NGrrKLUhgT3LCf4ftnN8uVZOjNqyMvQRn2jocqCQvxCR3W0CsLhA+3f
	QSGviabUOJkpGJ+Xw/ptFvcnVkR8jaSgr0STvK+oi/hAxP5AsBantdYawhgDuAWiUEpx7ZmsawV
	wxRWpLW96oBtgaHyd9sUQe6DzB9XgV1nIPvtSALy3aErqJ4gP9z3RE7UkksF5OKhlPP9OkDeLow
	nQ+LtkO8c3fofor/zzVXNey8Q60VYgdoWze213SUF7B62g/ahdGQb79FRtCekSTNuH7SBKm8LKw
	95A63oSSmpUNt2mnld1K4qk8NyulFaIDnDrFHyQ6n6tQfPA4wEv6gXYxQmRkoMpJx+sSZEtGhPK
	to22i7/JLWIf/mms2kdHetIGaCvgJ2s1Mxkhi5gu2rbe473UpWKmV4/AFPpac4BtQeFs9iYhbsn
	jhVwylq+VwQMv0ibOb/ty44hKf94
X-Received: by 2002:a05:6102:e0a:b0:7cb:bc5e:7d9f with SMTP id ada2fe7eead31-7d2a153ee73mr2430046137.11.1794018330516;
        Fri, 06 Nov 2026 18:25:30 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2a89412besm2642472137.3.2026.11.06.18.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:29 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 2/9] dt-bindings: soc: qcom: aoss: Add compatible for SDM670
Date: Fri,  6 Nov 2026 21:24:46 -0500
Message-ID: <20261107022453.159341-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
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

Document the compatible for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index e94c4fd34177..6a817a1cd395 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,sc8180x-aoss-qmp
           - qcom,sc8280xp-aoss-qmp
           - qcom,sdx75-aoss-qmp
+          - qcom,sdm670-aoss-qmp
           - qcom,sdm845-aoss-qmp
           - qcom,sm6350-aoss-qmp
           - qcom,sm7150-aoss-qmp
-- 
2.56.0

