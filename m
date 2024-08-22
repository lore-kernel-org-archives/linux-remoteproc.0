Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110E71CDFBC;
	Thu, 22 Aug 2024 17:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724346609; cv=none; b=juitUIcwW+I1FdqHQzy3H9SHqKQqsKkFjnJ1C6ODdAxQeSrvUy2PEYSWihur21+/vVPZUgu0oxsPvmgnhRCauPrrMmBHkXMYQD0Rqi4dukOF2u7RGDgqQb16rdvRfl8Cp75jnvtfscNaUnWB/UTcnvsmcnYE0PrrVqnpHqlFKV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724346609; c=relaxed/simple;
	bh=tjYqHSZ78Vr1VCrbyX6z4ILSFvcR9yZhzm0jR0X3XAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g/5QgHiQ719L0eQzW0jd8QHT09oA5iD106xlR9X9n8idMfUiBoNfIEkrrfbDSJCmQLb5C3K9p4VpzdjNz8jB2JiapgcUSBlRzQit5sf7DdAg6ZgTAyNFiGXZewiuIjhEQnW7BRw1eNK11d7tpBJc6tfsMLZUCVp0NhWPhhex7sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19EF9DA7;
	Thu, 22 Aug 2024 10:10:32 -0700 (PDT)
Received: from e130802.cambridge.arm.com (e130802.arm.com [10.1.37.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD27F3F58B;
	Thu, 22 Aug 2024 10:10:02 -0700 (PDT)
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
Subject: [PATCH v2 0/5] remoteproc: arm64: Introduce remoteproc support for Corstone-1000 External Systems
Date: Thu, 22 Aug 2024 18:09:46 +0100
Message-Id: <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Corstone-1000 IoT Reference Design Platform [A] supports up to two External
Systems processors.

This patchset allows to control these processors through the remoteproc
subsystem.

The Corstone-1000 implements the SSE-710 subsystem [B] which defines the
MMIO-mapped reset registers (EXT_SYS*) used for controlling the
External Systems [C].

This patchset provides the following:

- Device tree bindings for the SSE-710 subsystem with syscon support
- Device tree bindings for the SSE-710 External System
- Corstone-1000 External System, syscon and MHUs device tree nodes
- Arm MHUv2 Mailbox [F] device tree nodes for Corstone-1000
- Corstone-1000 remoteproc driver with regmap support

For more details, please see the SSE-710 External System Remote
Processor bindings [D] and the SSE-710 Host Base System Control bindings [E].

[A]: https://developer.arm.com/Processors/Corstone-1000
[B]: https://developer.arm.com/documentation/102342/latest/
[C]: https://developer.arm.com/documentation/102342/0000/Programmers-model/Register-descriptions/Host-Base-System-Control-register-summary
[D]: Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
[E]: Documentation/devicetree/bindings/arm/arm,sse710-host-base-sysctrl.yaml
[F]: Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml

Changelog:
============

v2:

* provide SSE-710 syscon bindings
* provide SSE-710 External System bindings
* add Corstone-1000 External System node under syscon
* add Arm MHUv2 Mailbox device tree nodes for Corstone-1000
* add regmap support for the driver
* use devm_rproc_* APIs
* refactoring

v1: [1]

* introduce the Corstone-1000 remoteproc support

List of previous patches:

[1]: https://lore.kernel.org/all/20240301164227.339208-1-abdellatif.elkhlifi@arm.com/

Cheers,
Abdellatif

Abdellatif El Khlifi (5):
  dt-bindings: remoteproc: sse710: Add the External Systems remote
    processors
  dt-bindings: arm: sse710: Add Host Base System Control
  arm64: dts: corstone1000: Add MHU nodes used by the External System
  arm64: dts: corstone1000: Add External System support
  remoteproc: arm64: corstone1000: Add the External Systems driver

 .../arm/arm,sse710-host-base-sysctrl.yaml     |  56 +++
 .../remoteproc/arm,sse710-extsys.yaml         |  90 +++++
 arch/arm64/boot/dts/arm/corstone1000.dtsi     |  34 +-
 drivers/remoteproc/Kconfig                    |  14 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/corstone1000_rproc.c       | 350 ++++++++++++++++++
 6 files changed, 544 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,sse710-host-base-sysctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
 create mode 100644 drivers/remoteproc/corstone1000_rproc.c


base-commit: 8fa052c29e509f3e47d56d7fc2ca28094d78c60a
-- 
2.25.1

