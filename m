Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6A6D530
	for <linux-remoteproc@vger.kernel.org>; Sat, 24 Feb 2024 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708765964; cv=none; b=LZQPG+3MOYaWfZ9SbSJBhRBtW9uzUJpSZC8COa3KY7WN0hQ0sWIsg2cqOtooZuZ42OQKS4ikzH4zTFnZ2mzRvXWq2U2GUz25Tzpbq+0cE5OtTKdMzyz4138u1JoTOeAj94xFOAIKgq3GaVCmC2vq2puJl7MIniX+OtSWt8YVZxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708765964; c=relaxed/simple;
	bh=QJHaYzPY+m0OHtHiflvDg030t6MnJOuacu/PCuwm03k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=On163riC6C3Pp1sym6jR1/ud+woTYNLVJbGgRpnrxxOXdl9O8hKubWwBeHhNWduQcJOA7rXGzbxTSfZqTDQeXRI95HCesn3HdK2QmhGILoKBOoBtAMnEJHs35BKM9QkdtNs2wcLgr+9nTiuRJd+204HVJaDaiv+/uGVhBHHZjuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oD5+EDKs; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oD5+EDKs"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-563d56ee65cso1860193a12.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 24 Feb 2024 01:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708765960; x=1709370760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSJ+PeO4x72bs3AUvmTEqtOywxqrxagbi+uMUHWuQSQ=;
        b=oD5+EDKsCqSB++cRrpFfBwCb/J82G2d3Svs5NOnwqgpBw2c4bdZZLqjT+s4MSzUB94
         rFNbBcYCdI99RLoP7k27BF0R05ZHlADbtTZTcIjdSr5oAEzvDQX2BAvObAaSA+yLXf5d
         cKxaMlELTaZuyypcleWFJ/iVp2RvfvzRjmHFJU23hbHZiof5ICfJJ9itaBgfxUOdXSMm
         Jn2nmIGfWWn2nj1bmcgeELrJv9/ap7CMkqq7cFm4tLznsIUU0rmmMRL0t7iYHFMyQ7ri
         UMXDgVW4nyilih9oGpZ6z+0PpTPj7cImysWeOavYYrDtyhAmt1lRno24aSU/pvWpF3+e
         wYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708765960; x=1709370760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSJ+PeO4x72bs3AUvmTEqtOywxqrxagbi+uMUHWuQSQ=;
        b=NUPb5sV32KcOcflXTGe7/OPj7iK7aed0eGyikq+u37Te+LurC0dpF81M3Labx5Vjf8
         xMJEf9s9PvKX5sbuB6tjb1dBjNlcxHBGoxrvQLEy938hgMxgtEpv2J16CVqHUN/ycpXt
         mXJEEH2TA/xWfyGdmtNcetrCdsAlzK8IY218EHXNrwicE/npbM0KTsJsTJLQ2HAewSE0
         WvgNBpYOEX/2M6a3mDvJzvajQXrBXcfW+LkvUdYN2R8+czjckYLdBR6ZCg01/2i9P0OE
         e36PWt1cALVxipPzzx1c5vJpthm0BGY0B3v9IrPWxv3iuUztIgl8JeLv43bNtSsWOHXp
         s83Q==
X-Forwarded-Encrypted: i=1; AJvYcCWU+rkl6dFAYTrRYOi5LJuWU7FxS/Dh/084CsHs9UWCSCTVA+kGilOLjeFZidpai8QI6xFXhX+WVq2eIPEAyDTEH3spP2LHmAUmH1aoUHHTgw==
X-Gm-Message-State: AOJu0YxasTh+O6pw+oCe/nELI1GcQ9a3FzC6k8WKDHL5a9NmQgPfcCEw
	TYSMSSDkFB8UQC7g+gbkyjwpEoT28hfgb9kBzJzVRmYSpq7JRV32MapGAv+d9Vo=
X-Google-Smtp-Source: AGHT+IHG9kPQkhg3JSWWrcuHi1+sLlRaO9d5IHwbE6um4kWNgdiD0lDhIkh1bAKYCo23+kRRc/aVwg==
X-Received: by 2002:aa7:d591:0:b0:565:af2e:d016 with SMTP id r17-20020aa7d591000000b00565af2ed016mr295203edq.32.1708765960266;
        Sat, 24 Feb 2024 01:12:40 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s8-20020a056402164800b005652f6a9533sm363120edx.74.2024.02.24.01.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 01:12:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: clock: keystone: remove unstable remark
Date: Sat, 24 Feb 2024 10:12:34 +0100
Message-Id: <20240224091236.10146-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keystone clock controller bindings were marked as work-in-progress /
unstable in 2013 in commit b9e0d40c0d83 ("clk: keystone: add Keystone
PLL clock driver") and commit 7affe5685c96 ("clk: keystone: Add gate
control clock driver") Almost eleven years is enough, so drop the
"unstable" remark and expect usual ABI rules.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/keystone-gate.txt | 2 --
 Documentation/devicetree/bindings/clock/keystone-pll.txt  | 2 --
 2 files changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/keystone-gate.txt b/Documentation/devicetree/bindings/clock/keystone-gate.txt
index c5aa187026e3..43f6fb6c9392 100644
--- a/Documentation/devicetree/bindings/clock/keystone-gate.txt
+++ b/Documentation/devicetree/bindings/clock/keystone-gate.txt
@@ -1,5 +1,3 @@
-Status: Unstable - ABI compatibility may be broken in the future
-
 Binding for Keystone gate control driver which uses PSC controller IP.
 
 This binding uses the common clock binding[1].
diff --git a/Documentation/devicetree/bindings/clock/keystone-pll.txt b/Documentation/devicetree/bindings/clock/keystone-pll.txt
index 9a3fbc665606..69b0eb7c03c9 100644
--- a/Documentation/devicetree/bindings/clock/keystone-pll.txt
+++ b/Documentation/devicetree/bindings/clock/keystone-pll.txt
@@ -1,5 +1,3 @@
-Status: Unstable - ABI compatibility may be broken in the future
-
 Binding for keystone PLLs. The main PLL IP typically has a multiplier,
 a divider and a post divider. The additional PLL IPs like ARMPLL, DDRPLL
 and PAPLL are controlled by the memory mapped register where as the Main
-- 
2.34.1

