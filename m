Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D14130CD81;
	Fri, 16 Oct 2026 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138824; cv=none; b=a3yWccatkhYFAGU9TGXUwbUkZ1duQWIZaW25iCN/rVWf2UJYVnyGgyAomGEwL+barMJkrjOQ6b19yK/gBhfIfy/P7CxJC6q9bB0xlIT0nX/pMsnrQdg9VYq+rFFeslHkL/U6WGiOKGzwiS2IpAXytESIMKBnKoDsKN8WgEluqUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138824; c=relaxed/simple;
	bh=OycpV4nk9Zu8OEnUs2uDOj58onhx7mT2B64LT+6j/A4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rcdurmWMTKYNISsokouUtgudoJa7BGAUfmywxyvZ23/u7m0+Y6MdDhdOjTXsRxDjaFGZTsVHMu7z7WQ9Dy6CJEOw1fkUN56uCfAETukFeJ6X3ICh/nGDXW5pZFaii7msQNRmQt+bqXFnYy+wiI/V9zA256eS4Y6reTumQUdvqJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1qDAv0Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1qDAv0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4B29C2BCF5;
	Fri, 16 Oct 2026 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792138823;
	bh=OycpV4nk9Zu8OEnUs2uDOj58onhx7mT2B64LT+6j/A4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=s1qDAv0QKvF0qHFDmXPTUM+kt/iVaekzjVEDz3sriomShzxX/pz9SVGeuScs5by8T
	 zzsQ0tCepIS88dkpj45RLE3H2Zgex17RjW7MSQDvABinYVsD3LYVtbEh85as05m1fP
	 DUVptgSR246BK1w5WIabCVflHKRUGb83QBgApnHLkZuE7YGrqhQ03i/kdTmd7Zb7+C
	 69pNzCwURrh2yx/JzP7img/Pvvx26vaa9tzSm/yUG3erTuhMyMgIBCubzvH0+1BVFh
	 3BmdTMGlWL+Mwwv4rIoqPFJc5sXsKPSzOGRY/PlbjaaXkwJNuaIMYctf1qBFpqY0TB
	 2fs2s+OuNsXmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9604CCCA462;
	Fri, 16 Oct 2026 08:20:23 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Subject: [PATCH 0/2] remoteproc: qcom: pas: Add SM7250 ADSP
Date: Fri, 16 Oct 2026 13:50:17 +0530
Message-Id: <20261016-adsp-sm7250-v1-0-2f39ac1f0496@brar.si>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDVpG0VcRSxaHYzETzqIRNxds
 fwW713AGAgZquSCgAcxLXOEShNoBzv3KMhHg5Y6V1IZYT2vgqdCGym8NaV3CrPC5hCLNWBH53e
 rm9+8uxHb7V3AfT84ty7EbwAAAA==
X-Change-ID: 20261015-adsp-sm7250-da58db1e47a6
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792138822; l=1174;
 i=patches@brar.si; h=from:subject:message-id;
 bh=OycpV4nk9Zu8OEnUs2uDOj58onhx7mT2B64LT+6j/A4=;
 b=+XwPKvXqDGjvYO9PAkCpfjbMxoc9vsdz8wDImDIYjWrsez0thPFaJyF5xrvQNOT57+N/kfj4M
 JzRuSXdCT12B4qjByU1KOcEBuUpZ1FgHUjmUrfQavv0i1mQ1ljI8j+g
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si

Adding ADSP remoteproc for Qualcomm SM7250 (Snapdragon
765/765G/768G).

The SM7250 ADSP behaves like the SM6350 one: same PAS ID, same
interrupts, same LCX/LMX power domains, same SMEM crash reason item.
So no new resource struct is needed. Patch 1 documents the compatible in
the existing SM6350 PAS binding. Patch 2 adds it to the driver, using
the SM6350 ADSP resource.

I am bringing up mainline on a OnePlus Nord (SM7250, "avicii"). With
this series the ADSP boots on that phone and I can play audio through it
and read the sensors from it.

The SoC devicetree is not part of this series; it is being sent
separately.

Signed-off-by: Ishu Brar <patches@brar.si>
---
Ishu Brar (2):
      dt-bindings: remoteproc: qcom,sm6350-pas: Document SM7250 ADSP
      remoteproc: qcom: pas: Add SM7250 ADSP support

 Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml | 3 +++
 drivers/remoteproc/qcom_q6v5_pas.c                                | 1 +
 2 files changed, 4 insertions(+)
---
base-commit: 23d0516587f896f5f16a47c97ddb41d28e6289ff
change-id: 20261015-adsp-sm7250-da58db1e47a6

Best regards,
--  
Ishu Brar <patches@brar.si>


