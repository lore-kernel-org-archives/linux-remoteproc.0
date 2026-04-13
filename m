Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C87A3A9603
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2026 15:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776093062; cv=pass; b=dGqASg1oujh+vC8Xvp51cbd25Rwz2rGnNSyUsoKvFuY6YFn+JnIox0wh+NCU9hPAyUO6n5w45PLoD3odIt3b99Tchn7QE0do9CI3zd3WqDis8IK9gAsIn8TGRNhyv+9vdWG5EM67Vh22zsp3kSmdqbRmd5PHSjXcBG9lR7bOiYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776093062; c=relaxed/simple;
	bh=O2uW+LuabfBHowZLAE9KuPtlYpe9N2rpcgEj5BgA4ZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lkOLmb8Aiara0mnxb+BXO889UE8eILMnr3bDfgm6722eRwfsERTW5hkQRrwAYa/HfpU8VldouRD9JFoMGg0wDLgX7l6MAXQqU/0OCbXEg2wTma3xFWNdJkOj87gC7eemc5kcchogMEeZDDWaVN2GYQDBr9ImAgIOQjeMj5odzP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VsnlDiQI; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VsnlDiQI"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6712fd40860so2613900a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2026 08:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776093059; cv=none;
        d=google.com; s=arc-20240605;
        b=ZBQE5Glfn4LAO/m2DsPb08mg5rGRu1/euXSavdLL30g28grNUfjEaq0lOz11lFUdyd
         vLIRz3dQCbpKdt/k2HDPui/cswraz9jSZdAxdB9pihnHjkedeEnKQbhHBl991wu/ppNX
         F+N9cAeIePeuxj02IL8RyfVDBnY0J9hxKO1THFYLAjpPld/HdMHDvrPyIIihBsuOsKVP
         iMVM3obw8ajY8uVMkeQzVvUYpitQxzzyNCioqy9+R0Is6j4QSPXGfa/WUJHHqhxYvAK2
         MLowMMQHdC9EuV9ph7mJ+MUxACHCc/0vRl6eb/+bPCmcVpVE09tkNUOzajww2qmIhJ0f
         Fzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vM9wZdZcyMlqdDFu3IlYmYUvddN4NzeV7CdThu4jwmo=;
        fh=tVER8nx75htjrc6o4dwc5I0wTuL8+HpRi59paBuDlHc=;
        b=SmaQKWAnRkJ8jEHJ77VMVF68AkpfuXIZF9+SljCFzO3i6JKTR2n3IOuc8EjD7hVWeG
         jVNuXGh+wlssNQbfuAk/H3Vugm6FcTJt0I0vPsFnoFcjVdpNOHiVQTvZyUV64C/V7opZ
         9KIGwZOZwqL+4WYGbgATeFg60ev50YlNVpzOhuiSTbdkaoiT9dGsNcWU/m3cJGv4GiSk
         +RuZRQ8CJxTJVJswdsQq4TzVQkjbuBqQr/newou26BB/QWB8i2AYZYyXqAHh2ZYE4/Fq
         fyNMH5zFu8R2dqT0RfEudTiiGndfkTzE29EtP6B/CD9+vJWl52sTBAJ2uSmOm7xHGoO1
         kIjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776093059; x=1776697859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vM9wZdZcyMlqdDFu3IlYmYUvddN4NzeV7CdThu4jwmo=;
        b=VsnlDiQIO8eUcV1KUQ5gjlSjhr20I2vWg2VTIlezx/mF7GHAejK6QhCFWAI418Qudf
         zolrwx/kY/EHGeMkN7vLuVdG9C1YttInw0Rak13j7W15gZKo9leU3gPSHx9Al278zvar
         P/HWY+BJ/UIH+gWMGOhDvP76KvQEQbiZNWgALprm1dx0brw4+JNbkRsq6PHD5Oykj8/P
         0GS3vk5fUuwkfsxypnadEh9DPHM+5dN6CUNS1bOXdtoYPqEfaIwxCymc4IvXC2A4/o+W
         IpuZnjiawMiWBTtf94vimoMqGC8MZ8iZ2ULw/qCyjrFTe2cdtm/a0rdYfN5hah8yBty+
         JRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776093059; x=1776697859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vM9wZdZcyMlqdDFu3IlYmYUvddN4NzeV7CdThu4jwmo=;
        b=sD4f/f1OV5twBtX5a56p7ctEZz/X7NkpMwXnlxNR1BL12gt+BiTVsVF3fEm18+S4DD
         NfWr/xUUn4If680Gki71iHm8AaZAUJljD4mT9HroUSIkdAqPBDEtFQT7W0s6G6T/OQEX
         PfCjK6+eIRyRUHmkWfYbOa3f20Z8dQCJWSrT/F2c6N6pgowDLUlYDD+fZHwFaihcK8hM
         qJsP2Po2TlwQYWK6w8ynZODnGRwXyQ34TOrXAvIaJYiPbNDv70PTOSrN8QTbMVFpsV/h
         9IxOz8JqRl/2/oIStzNaQs4HE+smcRFw+/7EC7dRIA4ho0U1RCp92fZ/bOjCio4jAoHs
         EHDw==
X-Forwarded-Encrypted: i=1; AFNElJ9PrOpag7RsARAHvqzJJUMd9r8j8+acEvCVZ9ZEoKWNM2IKeaEKCYrMT59/RHQm8Aq9JX9AWEj8K3xwWuww9Txa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx74l/w6d4PavPoLQxIrDGer/vV+A2EYeKXUw0AqMWJDdRwxDts
	kf7Bssc83VF/3oR0/U559OG6y2i4igzpYRhBBrZos5X4BjpUqvMqV8zXuI1ysR1UcHCNz6XK4PO
	IwanvGjfHOuSWb7/20TLlS5Yzupk1sEgQLg1UN14xPw==
X-Gm-Gg: AeBDiesyzWnmCgldCg03QlEoxuC9f19ngf+vn/N1dvbWE5bJ6aO5mmKTz3mz9edkZfy
	gbtkcJ1UCO6MFlnWwb3sLxObTdr3r9mLMQ+gAsrrhThuDH5HM+F+V2H5gVpYhNNJ7B3Atw9QhrG
	55fMyMn0U9C/2T/zY6Zl/hruDNUjo/svC3zpCkF1Q39UOTUf69PxOkogWVNBwjgGI26hCb/7e/v
	EwHjkzIF2Zc8kLJltxwsoddaTNyrqFQ1wJ/0HRWC9BYFnl3u1ERWa4ULlz4hBhf7o+wvQjqdaz3
	FvKf9/C4mi6LbW6E8PUvZl9rQcqjZOfQl0jkVa3w
X-Received: by 2002:a17:907:a806:b0:b9c:3ba2:2da8 with SMTP id
 a640c23a62f3a-b9d72aeb9b9mr837246866b.52.1776093058550; Mon, 13 Apr 2026
 08:10:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com> <acqjS440STRl2sK2@p14s>
 <acs2PAZq2k3zjmDW@shlinux89> <adUghiyZbe3fmcNX@p14s> <PAXPR04MB8459AA009C932EB9D6139A11885BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <adZ4WIaC6WN97JhR@p14s> <adbzPl7ydUvb+MIS@shlinux89> <adkcugNgyrkHtUML@p14s> <PAXPR04MB84591BCD80728EE880CA2AD888262@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB84591BCD80728EE880CA2AD888262@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 13 Apr 2026 09:10:45 -0600
X-Gm-Features: AQROBzCaZSu11OL-gVz7edUov2FxFa3cn6A3jeYa2s3YGR-BUVKoLOxzFnKS1Lg
Message-ID: <CANLsYkyn9aPg6Z9CTOXzmjKobRKiBo0_d=uhtxgUcszeW4-VGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM
 reset vector
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Apr 2026 at 21:01, Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to
> > SM CPU/LMM reset vector
> >
> > On Thu, Apr 09, 2026 at 08:30:54AM +0800, Peng Fan wrote:
> > > On Wed, Apr 08, 2026 at 09:46:32AM -0600, Mathieu Poirier wrote:
> > > >On Wed, Apr 08, 2026 at 01:30:16AM +0000, Peng Fan wrote:
> > > >> > Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass
> > bootaddr
> > > >> > to SM CPU/LMM reset vector
> > > >> >
> > > >> [...]
> > > >> >
> > > >> > >
> > > >> > > Aligning the ELF entry point with the hardware reset base on
> > > >> > Cortex=E2=80=91M
> > > >> > > systems is possible, but it comes with several risks.
> > > >> >
> > > >> > I'm not asking to align the ELF entry point with the hardware
> > reset base.
> > > >> > All I want is to have the correct start address embedded in the
> > > >> > ELF file to avoid having to use a mask.
> > > >>
> > > >> I see, per my understanding:
> > > >> FreeRTOS typically exposes __isr_vector, which corresponds to the
> > > >> hardware reset / vector table base.
> > > >> Zephyr (Cortex=E2=80=91M) exposes _vector_table, which serves the =
same
> > purpose.
> > > >> I am not certain about other RTOSes, but the pattern seems
> > consistent:
> > > >> the vector table base is already available as a named ELF symbol.
> > > >>
> > > >> Given that, if the preferred approach is to parse the ELF and
> > > >> explicitly retrieve the hardware reset base, I can update the
> > implementation accordingly.
> > > >> If you prefer to parse the elf file to get the hardware reset base=
,
> > > >> I could update to use them.
> > > >>
> > > >> Options1: Something as below:
> > > >> 1. Include rproc_elf_find_symbol in remoteproc_elf_loader.c 2.
> > Use
> > > >> below in imx_rproc.c ret =3D rproc_elf_find_symbol(rproc, fw,
> > > >> "__isr_vector", &vector_base); if (ret)
> > > >>     ret =3D rproc_elf_find_symbol(rproc, fw, "__vector_table",
> > > >> &vector_base);
> > > >>
> > > >> if (!ret)
> > > >>     rproc->bootaddr =3D vector_base
> > > >> else
> > > >>    dev_info(dev, "no __isr_vector or __vector_table\n")
> > > >
> > > >No
> > >
> > > If your concern is about rproc->bootaddr, I could introduce
> > > imx_rproc->vector_base for i.MX.  Please help detail a bit.
> > >
> > > >
> > > >>
> > > >> This makes the hardware reset base explicit, avoids masking
> > e_entry.
> > > >>
> > > >> Option 2: User=E2=80=91provided reset symbol via sysfs As an alter=
native,
> > > >> we could expose a sysfs attribute, e.g. reset_symbol, allowing
> > > >> users to specify the symbol name to be used as the reset base:
> > > >>
> > > >> echo __isr_vector >
> > /sys/class/remoteproc/remoteprocX/reset_symbol
> > > >>
> > > >
> > > >Definitely not.
> > > >
> > > >The definition of e_entry in the specification is clear, i.e "the
> > > >address of the entry point from where the process starts executing".
> > > >If masking is required because the tool that puts the image together
> > > >gets the wrong address, then it should be fixed.
> > >
> > > The hardware reset base is the address from which the hardware
> > fetches
> > > the initial stack pointer and program counter values and loads them
> > > into the SP and PC registers.  In contrast, bootaddr (i.e. e_entry)
> > > represents the address at which the CPU starts executing code (the
> > PC
> > > value after reset). As you pointed out earlier, this distinction is c=
lear.
> > >
> > > In our case, we need to obtain the hardware reset base and pass that
> > > value to the system firmware. However, e_entry should not be set to
> > > the hardware reset base. Doing so would introduce the issues I
> > > described in [1]. This means we should not modify the Zephyr or
> > > FreeRTOS build outputs to make e_entry equal to the hardware reset
> > base.
> >
> >
> > As I said earlier, I am _not_ suggesting to make e_entry equal to the
> > hardware reset base.
>
> Let me try to restate my understanding more precisely and please
> correct me if I am still missing the point.
>
> From your comment:
> "
> If masking is required because the tool that puts the image together gets=
 the
> wrong address, then it should be fixed.
> "
>
> I understand this as saying that masking e_entry is not acceptable, becau=
se
> e_entry already has a clear and correct meaning: it is the execution entr=
y
> address, and the kernel should not reinterpret or =E2=80=9Cfix up=E2=80=
=9D that value.
> At the same time, we still need to provide the hardware reset vector base
> to the system firmware, and that value is distinct from e_entry.
>
> On i.MX94/5 platforms the reset base is software=E2=80=91programmable, bu=
t that
> information is not represented by e_entry, nor is there currently a
> separate place in the remoteproc framework to convey a reset=E2=80=91vect=
or
> base independent of the execution entry point.
>
> Given these constraints, I see limited options on the kernel side.
>
> One conservative approach would be to rely on a fixed, platform=E2=80=91d=
efined
> reset base for the affected SoCs. And update RTOS linking script to put
> the vector to the location of fixed hardware reset base.
>

The problem with the current patchset is the overloading of
rproc->bootaddr in function rproc_fw_boot() [1].  After that point
rproc->bootaddr holds the hardware reset address communicated to the
remote processor's firmware and not the beginning of execution as
intended by the definition of e_entry.  This is very confusing to
anyone reviewing the code without a clear understanding of the
context.

To fix this I suggest masking rproc->bootaddr in
imx_rproc_sm_cpu_start() and imx_rproc_sm_lmm_start() with a copious
amount of in-lined documentation.

[1]. https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/remoteproc/re=
moteproc_core.c#L1401

> Thanks,
> Peng
>
> >
> > We are going in circles here.
> >
> > >
> > > Given these constraints, the feasible solutions I can see are either:
> > > - option 1 (explicitly retrieving the hardware reset base), or
> > > - continuing to use masking.
> > >
> > > Please suggest.
> > >
> > > [1]
> > >
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> > lore
> > > .kernel.org%2Fall%2Facs2PAZq2k3zjmDW%40shlinux89%2F&data=3D0
> > 5%7C02%7Cpen
> > >
> > g.fan%40nxp.com%7C8a5ce35d492b4adb2d3b08de97192cbb%7C686
> > ea1d3bc2b4c6fa
> > >
> > 92cd99c5c301635%7C0%7C0%7C639114331565834960%7CUnknow
> > n%7CTWFpbGZsb3d8e
> > >
> > yJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsI
> > kFOIjoiTWF
> > >
> > pbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DPnkirz3BMEuLsJU9
> > MHQNon84HIyMX
> > > 08x1wCK04dS7VU%3D&reserved=3D0
> > >
> > > Thanks,
> > > Peng
> > >
> > > >
> > > >> The remoteproc core would then resolve that symbol from the ELF
> > and
> > > >> set rproc->bootaddr accordingly.
> > > >> This provides maximum flexibility but does introduce a new
> > > >> user=E2=80=91visible ABI, so I see it more as an opt=E2=80=91in or=
 fallback
> > mechanism.
> > > >>
> > > >> Please let me know which approach you prefer, and I will update
> > > >> this series accordingly in v3..
> > > >>
> > > >> Thanks,
> > > >> Peng.
> > > >>
> > > >>
> > > >> >
> > > >> > > 1, Semantic mismatch (ELF vs. hardware behavior) 2,
> > Debuggers
> > > >> > > may attempt to set breakpoints or start execution at the entry
> > > >> > > symbol
> > > >> > >
