Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834F637F730
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 01:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042292; cv=none; b=tdSzTY6xIo5bnztrvTiM0gxmP8hx4Y9i4B4Vzn48otmZeJlQncEVhTo2f1Lof9WkJ0aSDE+fFH3nfV09dSbANPF8/1KNeWAsqq3op889k2VufgrUTLLlJZtc071eiDiG9ZpjRE+/COoUP/sPpoYV6Zv3P2VkWRIPOBLkoG1ZJls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042292; c=relaxed/simple;
	bh=ulCX9DivHgpW5BC5fyfBvUAv6CGYle6DP695F8lkfbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMJtfphQqX95FtCZHsLmrkCz2e6mi1m7m7W+/B0OAXrM7XJZyhu9+HBwDcM8RsQ/KQPmdVHJheLGRBy2zjK+uDLVLkUr5KszQSKmqveb+oeN/zd5FXmwY55XtBIHOmIBQRZ9vZ6FSrW5SMyaHKIL8Jm4gU62YJcjfTtXujrHMQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoVu9IoO; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoVu9IoO"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb3so39233146d6.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 18:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042289; x=1790647089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90RAgwzAcvrx5dM1biB0Wk1pQcr+1Q3GdANhKbJFQMw=;
        b=VoVu9IoO62zh/PSeLgAr0dFtqqFjfr86F7hC26GYXojElkxxTIGiWZlclkG3Kpx34c
         56VtTueRpQnHUR0J5tNlpxxCh/VM1iU/dYNd5im0ZFX8qfEAydFPSM8z7mNxH/lQ4Oo5
         wVhuIQqvmZ0DHpErmEPyfZber6afrllA8DeU3ULq8R9dTTYP+K8/K3YhXxWEoJt+veP3
         wLdJF/rXyAZfRfxpFlUGGk0a+I4sKm3SMvo18tf2xPjbqby7paDMDsKVJ6DhXlSntSd8
         /jwiJdUO8ezaugXlAZMXG5UIV3oCCM9PbNA5sssCcdyZSjYh5Pd6lHZqNeEPYtu/9lRF
         fy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042289; x=1790647089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=90RAgwzAcvrx5dM1biB0Wk1pQcr+1Q3GdANhKbJFQMw=;
        b=mtXlgIhvVIozHbljoG6nBeY6Y9w/ZSfOHD3Kvozeh36Bdu1X+eD5YcAuWnAQtvAOHg
         Vgi/iYIkQ3VZeOVbTaT8l+nuiI+bsUL9DjETADAEuJWosTzbOiYe5LemkNxx4SuHRhdn
         Ao6lQc9JhNzY0g+KvJQTbX8ZJzOtlCun2cw/CRvKEkLbU4PsQBWxxalxS+OS/kn9zlC6
         LylDGy648b6i25GYfSpu79Gof6lv4ULQNBB7KiFm4hWonEg8mDiEp4/RNjoIBbTOJBjW
         dojgje64mU+aN6dLeEJIIc/Et8PtDeA/tNUzF8tR1p1nz4J369w0A9JTVx2tPY38uC7K
         ldKg==
X-Forwarded-Encrypted: i=1; AKwUvByusWsYR9qLI2ZF6CM+O35MkxqLocORKDG68StqCuxAf33UGDajQWW4CYD5WGD8dOlDuct6TQLP4VKFhEohMGul@vger.kernel.org
X-Gm-Message-State: AFuF++m/Fkb2SrUEIBQ16ukDXz2cRf2oZlCqbPn+NHJyzsaOBruIxZPw
	3c67oVoPE3gqwutPd5JzATA8Q3klj1LrbarJzY0vul44GCai5YXOmxOd
X-Gm-Gg: AYBFou1NZsPBJH+1ZgoR7yUKFAKSZfo/HAHwbIiyLLEh6NjbmbD2cdSaWLYL/X7bfQk
	pn2TrAJ0XiH+1psQxpN6D+JV2HoC6qJbltQcqi1fSM3SLuTUuL/VkJD0waWvSJDmnwYUTLOkvOK
	hytj+XZEAGDdikko9KONPSYsOwGlEzGzl05qJjlF98WGPpOXynMlbekVoANRO3qCX7UmxIguSml
	yIgWYKULDhU0r3e9lfztbM2BuFSu90lyWrKWZQ4Et1NyOJSfJDwAjx3I1ZO4wHXh9izz2CAhoQh
	BqyY2gCHW1KUj/Ogv0p9H4KiO4okaxXz4q3ubuLwLR6Otl+qoxU3mT1O1oAP6cEkU7p/Y9JHL/0
	Aedz1OCpqSB5jEepQmjoR6H2vOjdKFmurWBI6/0u7nEte7/ag4Eeme/OlPrMtizdqcKToiCWOjX
	OhUy/yE0zhmp368hpTGnx646Hv26Qu03ceEecUxgA7bdcarMmujGWcrKYjWTzHGpkptHjTD+qnP
	Q==
X-Received: by 2002:ad4:5dea:0:b0:912:5b4e:3df8 with SMTP id 6a1803df08f44-913fc98e3f1mr33972316d6.50.1790042289461;
        Mon, 21 Sep 2026 18:58:09 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140250b82asm4010116d6.39.2026.09.21.18.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:08 -0700 (PDT)
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
Subject: [PATCH 03/11] dt-bindings: soc: qcom: aoss: Add compatible for SDM670
Date: Mon, 21 Sep 2026 21:57:53 -0400
Message-ID: <20260922015801.32373-4-mailingradian@gmail.com>
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

Document the compatible for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index d2ae2ae87a95..6672f441c20a 100644
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
2.55.0

