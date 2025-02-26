Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE22C22370F
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Feb 2025 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740581470; cv=none; b=BAzoOZrQ2PFes/0WmqL5K3po9eWQCap0qyFdxsBkzthW3WQstN1SmaQ+5G/X3LCu2pKvUGKTtuiPIXv8OT0V7+T7kCaxf4DTlGYrB08LkNtngQCOPi2p2dzuCA/dNhriNAiYaFU8daX7U8Jjjq3xGY9VjsJ8Pz4umbG6QrsAG28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740581470; c=relaxed/simple;
	bh=piZ8Qx7Zly2LRu7vla4X/tFQmM9QLWzUUZoYM5vZihY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fVT/5aHKZzjzhlLGPS18pz40L2myGqoK0n+w6rIMLby29ajjzxh8hCUhfE+U4cYXgiHpDJc/PJxQXH6fbetkPfnfGURBhp6B822iZXssxyCS3EQZ66o+hAIeDa6ccZK1SrbJUGLmKGyO2+yYpcoi2/sILX9SrTm3B+dUeiN6kNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nJn4NZlH; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nJn4NZlH"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dc5a32c313so1370796a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Feb 2025 06:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740581467; x=1741186267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPL5OtvPOd0OiAnfy72yXUM/L5nYTRUqyQwYMjGIY3I=;
        b=nJn4NZlH/ffOdqXN9qH2kkkxc4CzCN/uTLvpSzOD6xNxgFckwyxBUScL7ey7tH6rSN
         792Xz/uB9h2IU8FLgq4zfrrrjIkxEVpOrpcRkVZuaJAvIki8snyKnvmelehOHnJm6JJF
         81MM8QStl2QJ+oGRds9/91sxXEJb6K7Zq/lyWd2BpXA4eD7EjWJ/AbB9dCUTXYFbqc/j
         0xpBQw5OQq6Yhd9Pf1yD8i1IVX9WdZIpZlRR7WoY4Sgj8BmrMzWVYfodDSE+LmzTe+1/
         XlrxPCnCUQidfprdquLnmrS5hS15BBRqvmyCztt6s8kVBlzXQlJ6JDG5+wVkv0opLdSv
         C7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740581467; x=1741186267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPL5OtvPOd0OiAnfy72yXUM/L5nYTRUqyQwYMjGIY3I=;
        b=tiTv3KRA3UUrn7X1Kys/0kim3HIz30KyyIKH7bCvr7PjPeNiFqs8G7R9+q1air0UqD
         GDl9acPpO5I1BznySXHex+x5Wrrzdf1XvNXUQ1/Zj8TJ0ArXd+Y3fGoAXWQTAKkYbfY2
         yW8xjoImXhvaD76BFNrvlucdO1MhKez9Miosd0M0ZpiuEJjJRh4yCVFdW+oPTClWnDuQ
         TOcVm1M16sV0aA5sFTyL6/c06r+sQ9GLiwHZp9+irnu9UUDNWJ++1IZ007a/H1gTd/IB
         e1AUbCcYRBlKt6c4SfO2N0to7uWD6RRvqa7yvxJpJO9W2dH+mU+y+RWqtWc6DAluT8Sx
         BWeg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ8wy0uAR4z9n/8RoymHTRfBX0uzdv0E2B0YcLXwHr5PLIL3qdXHroP6KUfjvbCyhyA/rA6xul2ZW4UpOZn2eW@vger.kernel.org
X-Gm-Message-State: AOJu0YzlgECWqzfR90kweLgNyo8OBWgLv1yuIE22l6NGssJ5hE/DrPPT
	qio2Pn1LDyAoPlHkuS3u2cJOQMnigCDKnZN0PJKalvU0bodhbiGRVZLcmNo55MU=
X-Gm-Gg: ASbGncuQh8cLANey+669bE+bnNfZDFObADxkiq1AAVL+OKYiq9mdcfr1ZB/9pupa2gO
	7w+5hI9XxwaFFytkugGtqWl0s9zlFgfEgRJK53t5h0hHmN02GrYyFxq13FxS/kCIf+91VM+VpTH
	DISCHXo+C5spw/rS4KCgwwtowvNTLsi56iyzQeCIz2TMvTTalfQm/c+WaCwDPtW81r6XkxmAApq
	4eETWDomDFtDCn7Ct5By2nXJBLH0wr7HP7D/p+Y3lsK7N4b9rc4d5BfgGucnJRRaVHOC2/nBoGv
	R12a9j2z+WAotinjGmtDHztntfCIAu0sedxvKUtIChpo8+LemjG/osnvXQDf1lqn/4y+f0jb5I8
	Zmw==
X-Google-Smtp-Source: AGHT+IEblvH9C+/IxOlb268xBLoBJ6CHeZV4hc+SEnuQVt9gsMb7Ys0EDvzEpZU/6FgDLvXxyTLMng==
X-Received: by 2002:a17:906:2453:b0:abe:f613:bcff with SMTP id a640c23a62f3a-abef613bd71mr115534566b.0.1740581467102;
        Wed, 26 Feb 2025 06:51:07 -0800 (PST)
Received: from krzk-bin.. (5-226-109-132.static.ip.netia.com.pl. [5.226.109.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2054d9fsm339110866b.147.2025.02.26.06.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:51:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: remoteproc: qcom,sm6115-pas: Use recommended MBN firmware format in DTS example
Date: Wed, 26 Feb 2025 15:51:03 +0100
Message-ID: <20250226145103.10839-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All Qualcomm firmwares uploaded to linux-firmware are in MBN format,
instead of split MDT.  No functional changes, just correct the DTS
example so people will not rely on unaccepted files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index 059cb87b4d6c..eeb6a8aafeb9 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -127,7 +127,7 @@ examples:
         clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
         clock-names = "xo";
 
-        firmware-name = "qcom/sm6115/adsp.mdt";
+        firmware-name = "qcom/sm6115/adsp.mbn";
 
         interrupts-extended = <&intc GIC_SPI 282 IRQ_TYPE_EDGE_RISING>,
                               <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-- 
2.43.0

