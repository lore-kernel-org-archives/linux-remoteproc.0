Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759571CE70F;
	Thu, 22 Aug 2024 17:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724346622; cv=none; b=ias62CUB0L1rObovNpGfVsSpNDA+FhxjXXye/uhfvkgbF5xlV0gXJzEiUiKlekUu5CZgzfkf5PVfqMg75ojCjQPsEAUSfELqi/3S5TBHxj4kNMkCp+uK788eJF2rSZuW+ZS3lxqoeZWcpC0a74H0A1aDVKfURjB6iRMPnP71l5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724346622; c=relaxed/simple;
	bh=O3wC87vh8+30SLLrbyihGQV6hC1v8cqmuw/RrrA1X0w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y2Vre6z5+ZwXOppgd1Hi0nNdWwW2DU7aYq4Jb9Ff0GPw+b9tAXAX+/xjk2p4fkDAU01FXjAVjHohZ6sI5Z+DTs7JMbhMO/RVDQ4v/6pyya1jfUI/c0XClj1pUqrp35Ov3h6iUyVRe2YnyuGodMh3YlgfypnedwddXcC6xjPQ/gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ECE0DA7;
	Thu, 22 Aug 2024 10:10:47 -0700 (PDT)
Received: from e130802.cambridge.arm.com (e130802.arm.com [10.1.37.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D3B03F58B;
	Thu, 22 Aug 2024 10:10:17 -0700 (PDT)
From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
To: mathieu.poirier@linaro.org
Cc: Adam.Johnston@arm.com,
	Hugues.KambaMpiana@arm.com,
	Drew.Reed@arm.com,
	abdellatif.elkhlifi@arm.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	liviu.dudau@arm.com,
	lpieralisi@kernel.org,
	robh@kernel.org,
	sudeep.holla@arm.com,
	robin.murphy@arm.com
Subject: [PATCH v2 4/5] arm64: dts: corstone1000: Add External System support
Date: Thu, 22 Aug 2024 18:09:50 +0100
Message-Id: <20240822170951.339492-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add extsys0 remoteproc node as a child node of syscon

extsys0 describes the Corstone-1000 external system [1]
(the remote processor).

The host (Cortex-A35) can control the external system through memory mapped
registers located in a memory area called the
Host Base System Control [2][3]. This area is part of the host memory
space.

We use syscon to represent the Host Base System Control area and the
remoteproc node is a child node.

[1]: Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
[2]: https://developer.arm.com/documentation/102342/0000/Programmers-model/Register-descriptions/Host-Base-System-Control-register-summary
[3]: Documentation/devicetree/bindings/arm/arm,sse710-host-base-sysctrl.yaml

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 arch/arm64/boot/dts/arm/corstone1000.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/corstone1000.dtsi b/arch/arm64/boot/dts/arm/corstone1000.dtsi
index 01c65195ca53..17d6638f9ca6 100644
--- a/arch/arm64/boot/dts/arm/corstone1000.dtsi
+++ b/arch/arm64/boot/dts/arm/corstone1000.dtsi
@@ -103,6 +103,18 @@ soc {
 		interrupt-parent = <&gic>;
 		ranges;
 
+		syscon@1a010000 {
+			compatible = "arm,sse710-host-base-sysctrl",
+				     "simple-mfd", "syscon";
+			reg = <0x1a010000 0x1000>;
+
+			extsys0 {
+				compatible = "arm,sse710-extsys";
+				#extsys-id = <0>;
+				firmware-name = "es_flashfw.elf";
+			};
+		};
+
 		timer@1a220000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x1a220000 0x1000>;
-- 
2.25.1

