Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6181C3CF02A
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Apr 2026 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775660621; cv=none; b=TKZ4WA8oNTOF5EEhM50n89JfLJriN0wC8Z4UIu9XkpGVWvkPzKMCK2U5PzRf59sMghJwhZmifK1vo+agWpGcBfUt1yJojiDYvivmyw2LCDkGihbjHBw8cvmxfUNIfoSjeG6RsDTazOiR+MdVGxFWVWBPFODC2F1hHehzmZHf+v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775660621; c=relaxed/simple;
	bh=Betpu6YlX50HXxx8cB8c4TNDrqRx4yczkSoAvANIAAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dE4UUXfNQRyTinfQWRBx0PamqhtbY4Sg+OCBvBoS+XylltX0utJ74IxF4slcuOPPm0zso5PRqVyCfEp+9YbfL7CHXNA3rU1Due+XLrx7ogp6vzERk0PiR9x6kHWl/GKn9PhtP1naZTv4igXr3+TQUoSJ3JocSnrI0DKeXP0t3t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BwWpSuEG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BwWpSuEG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105A0C2BC9E
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Apr 2026 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775660621;
	bh=Betpu6YlX50HXxx8cB8c4TNDrqRx4yczkSoAvANIAAE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BwWpSuEGh33P1HdOPUETTUh2GGicfP/E1wJq2vWfnrd590+xMej5M0vHycujXFfQp
	 rWbgI2U92dN7FtM1PzQlioqocdbGOStnfIKTvA7D2+9GJRM4ApH/w1NF7D527il5fS
	 eK/Hq04JUjC2iaoyTGCoCRKPaNshlgIvprkWX39rJkKbfQSQcaTRkpdbxYIGs37WJ6
	 E8S6dZLH5TbFDRE3oa4mjKzABmoD2ZP3tvhxJMPw5hBHHMvcQqgGcKta4zd/F+ChX2
	 suRPLFMDhoLEi4pn4Gl2iohsYwXyPWa4rQfg0i3dwmg/XGaDu0pSOlAwu0yvCujwhX
	 1gPzE2CTN/DHA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66eba04b29eso7501672a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Apr 2026 08:03:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZ2y+pKPV2rA4sVzz7zeRBWDHB+GWYpoOaSYAOu5rf1I4wccTnb+KubAg3CA3VOwXPICYP2wjNCcbgrroC26A7@vger.kernel.org
X-Gm-Message-State: AOJu0YzGM5odJaUTtS5B7zBuMM38vCm2Av0WQtelxx9uU9XAHoqIz8Bl
	s2Wkbl7OU5vc9Rz45Xy8Unnh3GlJYlo5SVQcTIZIxGMRjs7JecJrnrLmMZv1Ec5rnd2W9G/whwg
	pq4jQXmGINVikA2xcduyxBOpLsFvc2Q==
X-Received: by 2002:a05:6402:34c5:b0:66e:43ef:2951 with SMTP id
 4fb4d7f45d1cf-66e43ef2a4bmr10220819a12.4.1775660619555; Wed, 08 Apr 2026
 08:03:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Apr 2026 10:03:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJq=3z7SQX_26MGGRcmysnGHVke8aTwyDCesvOuQjEN+g@mail.gmail.com>
X-Gm-Features: AQROBzClMUtPoA2R9xbP9UQlxvhX-iW9IARKlNopJ52gDn5_0cggpUPCuN1htyU
Message-ID: <CAL_JsqJq=3z7SQX_26MGGRcmysnGHVke8aTwyDCesvOuQjEN+g@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
	Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 10:14=E2=80=AFAM Markus Schneider-Pargmann (TI)
<msp@baylibre.com> wrote:
>
> Hi,
>
> Split the firmware memory region in more specific parts so it is better
> described where which information is stored. Specifically the LPM metadat=
a
> region is important as bootloader software like U-Boot has to know where
> that data is to be able to read that data and resume from RAM.
>
> IO+DDR is a deep sleep state in which a few pins are set to be sensitive
> for wakeup while the DDR is kept in self refresh. Everything else is
> powered off.
>
> The changes in this series were suggested as part of the IO+DDR u-boot se=
ries:
>   https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com
>
> There are currently no real users of the memory-region that is split in
> this series. The size of the memory-region in total stays the same.
> The new layout is derived from the software running on the r5f
> processor:
>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/exampl=
es/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clan=
g/linker.cmd#L172
>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/source=
/drivers/device_manager/sciclient.h#L459
>
> Additionally the two important devicetree nodes for resuming from IO+DDR
> have the bootph-pre-ram flag added as this data needs to be read before
> the RAM is in use.
>
> Best
> Markus
>
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
> Changes in v3:
> - Squash the enforcement of the memory-region-names requirement in the
>   patch adding the memory-region-names, as suggested.
> - Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v6-=
19-v2-0-37cb7ceec658@baylibre.com
>
> Changes in v2:
> - Make memory-region-names required if memory-region is present
> - Fixup memory-region and memory-region-names conditions. Require either
>   2 or 6 regions for memory-region and memory-region-names
> - Reword and restructure the binding documentation for memory-region and
>   memory-region-names
> - Add memory-region-names to all uses of memory-region
> - Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-=
19-v1-0-12fe72bb40d2@baylibre.com
>
> ---
> Markus Schneider-Pargmann (TI) (7):
>       dt-bindings: remoteproc: k3-r5f: Split up memory regions
>       dt-bindings: remoteproc: k3-r5f: Add memory-region-names
>       arm64: dts: ti: k3: Use memory-region-names for r5f
>       arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
>       arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
>       arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
>       arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase

TI folks, Please make sure these dts patches are picked up for 7.1.
There's now a crap load of warnings in next with the binding change:

     58 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a
required property
     30 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a
required property
     22 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a
required property
     22 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a
required property
     22 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a
required property
     22 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a
required property
     22 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a
required property
     22 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a
required property
     21 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a
required property
     21 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a
required property
     21 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a
required property
     21 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a
required property
     12 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a
required property
     12 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a
required property
     12 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a
required property
     12 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a
required property
      9 (ti,j721e-r5fss): r5f@5f00000: 'memory-region-names' is a
required property
      9 (ti,j721e-r5fss): r5f@5e00000: 'memory-region-names' is a
required property
      9 (ti,j721e-r5fss): r5f@5d00000: 'memory-region-names' is a
required property
      9 (ti,j721e-r5fss): r5f@5c00000: 'memory-region-names' is a
required property
      9 (ti,j721e-r5fss): r5f@41400000: 'memory-region-names' is a
required property
      9 (ti,j721e-r5fss): r5f@41000000: 'memory-region-names' is a
required property
      4 (ti,am62-r5fss): r5f@78400000: 'memory-region-names' is a
required property
      3 (ti,j7200-r5fss): r5f@5d00000: 'memory-region-names' is a
required property
      3 (ti,j7200-r5fss): r5f@5c00000: 'memory-region-names' is a
required property
      3 (ti,j7200-r5fss): r5f@41400000: 'memory-region-names' is a
required property
      3 (ti,j7200-r5fss): r5f@41000000: 'memory-region-names' is a
required property

If they aren't applied, making  'memory-region-names' required needs
to be dropped from the binding.

Rob
