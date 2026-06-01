Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BDA37BE9F;
	Mon,  1 Jun 2026 12:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317787; cv=none; b=TWDV3bjqbJ1UpEkngzUCR11z3a1w3KlpewBU3Ll1flOYq8w1Cz/CJ3JvRQC97gYhdnNdgaqyRrCOu1GWHt7TvNgzkkbNPvyarQbBQHB+oan4plfR7JciNY1dQV/FeCdIzs+Ho56mugnXZM9Geng7akEaTDtAwkPGmF/OPLi2Z1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317787; c=relaxed/simple;
	bh=HxCj1imFaDGqnqxOq1uQNFr3M4N4UQmU5zpkhhpFT54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ijlEtBHRQrac76KQxdwQkFS2h6smYd8Rm/eJ0ROUitvqpDHYnpbIFZqfRQ+frDPmcR35XWC/Bz9FNNWa2Vo4Ms3tM6XXqZMIomeCVxlXGB5Ol6DWhM4giN/18MBO1xiDNdEjtnqlLH6Y6F5czI/drLBpZu5PyqDA5J9D29Lgr6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=MutP/+D7; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="MutP/+D7"
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id E771A1F95E;
	Mon,  1 Jun 2026 14:43:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1780317783;
	bh=H1hVXwtOto/IFcO7KNTvhV0DieY8ZM/C1FwXh7ymHAY=; h=From:To:Subject;
	b=MutP/+D71iXBmL/0fGOHo9F2u8hZB9UQji9kB639/LAgliscV3Hw7Wt/xH02MwOJk
	 2/oRWDP2SAFd9XJfJQT/fxT/koBEv8ukqJkfSmKnZcx8Cm9+KYoYSaNqw09kgOEQ4D
	 4/TAsw7STe1eCA4Uz+SmNaiT4ajBkAXOEGrbPHdqT90PuwjqF8LJVe7ZgctcbZ8Dy1
	 mBSwyp030QjaCmDhZ4gmtvrMiyVc9UxIqtCSowcBHh9m1qpx6Qm/Btm8xAtRBUqRmR
	 8uLcz9nT39L3GHrPsDsS5ihGALoTOelLv2XVvhHLXzrIYd+4Cv6kyuftY0SU0eE+1i
	 ZufKGOZ+OdGJA==
Date: Mon, 1 Jun 2026 14:42:59 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>,
	sashiko-reviews@lists.linux.dev
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/5] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move
 wkup reserved memory
Message-ID: <20260601124259.GA76338@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601090205.076BC1F00893@smtp.kernel.org>
 <20260601-topic-am62a-ioddr-dt-v6-19-v5-2-3856a023aff2@baylibre.com>

Hello Markus,

On Mon, Jun 01, 2026 at 09:02:04AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Moving `wkup_r5fss0_core0_memory_region` to the shared `k3-am62p-ti-ipc-firmware.dtsi` silently truncates the reserved memory size for Verdin boards from 30MB to 15MB.
> - [Medium] Moving `wkup_r5fss0_core0_memory_region` to the shared `k3-am62p-ti-ipc-firmware.dtsi` causes fatal `dtc` duplicate label errors and overlapping reserved memory regions for Var-SOM boards.
> --
> 
> commit 65cd200377411c4597f1b662700915ea23cfe5f8
> Author: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> 
> arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move wkup reserved memory
> 
> The commit moves the wkup_r5fss0_core0 memory regions to a common
> k3-am62p-ti-ipc-firmware.dtsi file to combine identical definitions
> across boards.
> 
> >     Move the reserved memory regions used for wkup_r5fss0_core0 to the
> >     k3-am62p-ti-ipc-firmware.dtsi. These are all the same for the other
> >     boards as well, so we can combine them here similar to what is already
> >     done for the mcu_r5fss0_core0 memory regions.
> 
> [Severity: High]
> Are these regions exactly the same for all other boards?
> 
> k3-am62p-verdin.dtsi explicitly defines the wkup_r5fss0_core0_memory_region
> with a size of 30MB (0x01e00000):
> 
> wkup_r5fss0_core0_memory_region: memory@9c900000 {
> 	compatible = "shared-dma-pool";
> 	reg = <0x00 0x9c900000 0x00 0x01e00000>;
> 	no-map;
> };
> 
> Because k3-am62p-verdin.dtsi includes k3-am62p-ti-ipc-firmware.dtsi at the
> very end of the file, dtc cleanly merges the identically-named node paths, and
> the new generic definition silently overrides the board-specific 30MB size
> down to 15MB.
> 
> Does this halving of the available memory for IPC on Verdin boards cause
> firmware load failures or runtime out-of-memory crashes on the R5 core?
> 
> (Note: A subsequent patch in the series 'arm64: dts: ti:
> k3-am62p-ti-ipc-firmware: Split r5f memory region' changes the label and size
> to 1MB, which further truncates the region without fixing the underlying
> overwrite.)

Can you have a look on this?

There is no specific reason for Verdin AM62P deviating from the TI SK
board on this memory size topic, we should avoid duplication and
silently overriding those however.

Francesco

