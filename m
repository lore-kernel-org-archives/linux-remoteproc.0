Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E968C14A82;
	Wed,  8 Jan 2025 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736352707; cv=none; b=hchsEVnnboI8wjqp0pfBAOEsWNL+AnxtDcl0WqWUe1l6qFfQ6jYTafS5eKna1v8UaJ5GV31Ag/Vq2DrQpBcOsnXO9ogH26kGGJIhXTEFfWiRiJS+iHqL64DWE/R4SieNWSSnDMUkgKrFCCmbC5C5Q8PAU9HlT82q7iSlJ2EImkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736352707; c=relaxed/simple;
	bh=FrKByJVfkzw5OezDNbqdFAqbP/sKp05kiOFF7OZjQvc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ua3ynlRrhnG5utYlIM8NxmZCzzd3z59s5bHjLdN3ieRfWgCqXefFPREO/ks7U9dT8FrG03OuwcuCn0sv8agOs1h6h5pYtL6EkaUROQ/M55bbgdw7CCPpbOicNiH2xmo2TiONKbFRFMrrlH9LKNuUCLJd5yvNvi126ev9CPQ9a1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Nmji8pdY; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Nmji8pdY"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 508FoCNH2822969
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 09:50:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736351412;
	bh=lqFtwVC5XSLD055A7clzERGo2EcKKQ93ePEvcJRgB3A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Nmji8pdYdBU8WzwXSqvdyMTCyc3OO3VxoKNDLp1lp1pE48z59z9UWBF0R6JqDGLj+
	 Oopnntx5cT8HVK0eEP91IwygXvM48aAqV/zFMUL1dEHv2+biIkf7KeeY9q5z/N/CQ1
	 NbEqHWEpiD3HDU2TJdx5MSs3dIZtGDL/To5xRxfU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508FoCpk014885
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 09:50:12 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 09:50:12 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 09:50:12 -0600
Received: from localhost ([10.249.32.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508FoC5J086600;
	Wed, 8 Jan 2025 09:50:12 -0600
From: Nishanth Menon <nm@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Hari Nagalla <hnagalla@ti.com>, Andrew Davis
	<afd@ti.com>,
        Daniel Schultz <D.Schultz@phytec.de>
CC: Nishanth Menon <nm@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v11 0/9] TI K3 M4F support on AM62 and AM64 SoCs
Date: Wed, 8 Jan 2025 09:49:59 -0600
Message-ID: <173635131453.1207749.10651955130029971978.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240802152109.137243-1-afd@ti.com>
References: <20240802152109.137243-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Andrew Davis,

On Fri, 02 Aug 2024 10:21:00 -0500, Andrew Davis wrote:
> This is the continuation of the M4F RProc support series from here[0].
> I'm helping out with the upstream task for Hari and so versions (v8+)
> is a little different than the previous(v7-) postings[0]. Most notable
> change I've introduced being the patches factoring out common support
> from the current K3 R5 and DSP drivers have been dropped. I'd like
> to do that re-factor *after* getting this driver in shape, that way
> we have 3 similar drivers to factor out from vs trying to make those
> changes in parallel with the series adding M4 support.
> 
> [...]

I have applied the following to branch ti-k3-config-next on [1].
Thank you!

[9/9] arm64: defconfig: Enable TI K3 M4 remoteproc driver
      commit: 184caba444cfd4b90231de7d071b9966c115c29f

Thanks for the headsup Daniel.

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

