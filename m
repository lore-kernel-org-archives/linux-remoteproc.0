Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E07A25B09E;
	Fri, 16 Oct 2026 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138824; cv=none; b=NQ0I0WW2nW0NRMdfGlvvb2aN4IBwEW/HE12xqO5qRXpNupiSmhNKK3ScZwLUzXgqCRDfPwZ9NrB+FwQrVnZrVjG8LaWOY9djbAidNr8YGR+6sibojGvFZ0PAe6BpKb4OhUcaWB9Tvqqu1m+NjLThe4fE41Jul7mh7Xxt2kaKn84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138824; c=relaxed/simple;
	bh=n9WdwMuog1XJRuyf6viuwo1i2SnqRRud8PTaE6rIMiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZXPSCmFP7nvOqSDV44Ue8RRJLm8tZ3PYT2yqr817xCEG1Lh//iUeWMGuiBhrWDAKRTfOGa7H2HeX3F7O35WU6BdhH3OqEsqx1YANnDtJJJ8WAuZbyu8r9vpQ4qiD+O2P2xxP4hJZjNRKRZ1ftE8/hw84ylc1qXxDozok4yrw1Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bi7flnYP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bi7flnYP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC828C2BCF4;
	Fri, 16 Oct 2026 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792138823;
	bh=n9WdwMuog1XJRuyf6viuwo1i2SnqRRud8PTaE6rIMiY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bi7flnYPlJ99zyUXAUajuInwVOFXhaIWxS6kYEz+fVl+5HDWp54RoSK9NT0GaYksx
	 8N+Efnd8OwQMpy6r29R1BvEcdFHOpWz7LZBr2WzO6XXCmquM8ocW7W1NCeIgjOEQQr
	 0WldtQCpZZymPmw+aU5l3vBlRozetp05yndGwCJHj4xzEI09ju/TDL+LxENFkU5RD5
	 qI8IsOWwa/1v0oQwNJKT9eHp056vn8Ci9RTXkN5hJpmaL67DY4xTcSognLJm3/nFCs
	 iWk5RWq1W3V3kZFjWpS28ryQ5LHPOaGdkjwymvta7QKs2vJFIZhiUgAw/PrAg7SLmY
	 wG5OX9WbtpWBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42D5CCA464;
	Fri, 16 Oct 2026 08:20:23 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 16 Oct 2026 13:50:18 +0530
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm6350-pas: Document
 SM7250 ADSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-adsp-sm7250-v1-1-2f39ac1f0496@brar.si>
References: <20261016-adsp-sm7250-v1-0-2f39ac1f0496@brar.si>
In-Reply-To: <20261016-adsp-sm7250-v1-0-2f39ac1f0496@brar.si>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792138822; l=1256;
 i=patches@brar.si; h=from:subject:message-id;
 bh=z1Qa0DEUjqiJUo+KWFEZ0IxthpbJqvNpcU9mepDGsGI=;
 b=0ps9BSiImVNiWX1nXu7otNLfAfp3zFp1BKVoU9SXFUn+x1U/AYS5T5W5ytbPmdXlpYZFmllJC
 7dUui3uSHfTCvFQ1JFkZrSZS+C2VRRGW+ET2NwMVPZSl0uiY7iUMpER
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si

From: Ishu Brar <patches@brar.si>

Document the ADSP Peripheral Authentication Service on the Qualcomm
SM7250 SoC. It has the same interrupts and LCX/LMX power domains as the
SM6350 ADSP.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index 42e02c643..74f2037f3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -19,6 +19,7 @@ properties:
       - qcom,sm6350-adsp-pas
       - qcom,sm6350-cdsp-pas
       - qcom,sm6350-mpss-pas
+      - qcom,sm7250-adsp-pas
 
   reg:
     maxItems: 1
@@ -86,6 +87,7 @@ allOf:
           enum:
             - qcom,sm6350-adsp-pas
             - qcom,sm6350-cdsp-pas
+            - qcom,sm7250-adsp-pas
     then:
       properties:
         interrupts:
@@ -104,6 +106,7 @@ allOf:
         compatible:
           enum:
             - qcom,sm6350-adsp-pas
+            - qcom,sm7250-adsp-pas
     then:
       properties:
         power-domains:

-- 
2.56.0


