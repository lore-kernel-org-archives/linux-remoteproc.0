Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E5823D287
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Jun 2025 17:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749577005; cv=none; b=I/vpE8jk/Vz/y2zLsxqhl+C2OlH6MG0VQOLYt5ntY+ccd2i7uD4ejNrVoBn+bmbSLL3Jxnlz11QpY/RGWugQUNqNTp8hu93G2opOco5UyaPvEgjCj5GzBoeTGq1XB7VWpRiGFxIjWtmGtYKpO2Mwr6AqB7bNd12baE2b83vCwUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749577005; c=relaxed/simple;
	bh=dcv68wrINct14pR2gd1PKzKVMiG3dNz33M1S7uRj1GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTZJwwZETVvaHQ0O//LGRkNLUfsxs2IOuXcKzMrEhG91mojYZdUxm3FNPYBjoM5EDOL9LUObydoOj/0yvccWp6nxC4HiBXeN1kyJW9mxeh/xgrEJDPOEzJQzlVuvoGb4bh7/COpTuX+uc+vZ4yyLch8eeQJUtc3iGDNI0wkDdps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rq0Q2lZ8; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rq0Q2lZ8"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad88d77314bso1066553866b.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Jun 2025 10:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749577001; x=1750181801; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QNLtRYl8Q0eOmLpDGjVlOH3U6XH8t2IuXLhDXftAH7c=;
        b=rq0Q2lZ8ApbFKyr91LrEWytUjujjYmYfKsTIzNYSeinb89fK3j5dDKMCaEoaqf5FgS
         cQ6vOT/Ygkl45R2lQnrFq39B1yctJ9h0Jw8R+9U3YPatVuNa+JgRz/P2XrqCJwswKaWo
         T2+KF/5us5X86CtvmYeQ957dwAsQi10Q0Ynj9Tzl4h7zpvyAJYxKshrtVoBw3tFnGlCB
         1+bhWK6qN7dDKV8KEwR8TpCFSuop8XxyJgdUJI74ZuWp1hDvYTqh8k1/3DJ9MBjTKWLy
         ImyLk9XKRWQO9RtS4oyqs96yqTQ7QJWGIFd3Iu/+/X8FdfnTlxizy3yku5TCkzB31cKp
         uYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749577001; x=1750181801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNLtRYl8Q0eOmLpDGjVlOH3U6XH8t2IuXLhDXftAH7c=;
        b=j2+2tncIScRhi33oDBr8+FCHrqmzOdKjMwP9FY+bpQbVbiOcf9mX1lMxkLYKrmuFBH
         ZAQ9a5KdVtw6l92CXrvAnpvCCMmBpvnOQjpzRJru1tKAW91QVZg0nnfSGx0st1SPZo5x
         7FwjDkrksJZzj6Y3WGjCL8Vf9796dTjL0A2xIpb88qWYMbeBLQr9llQpQ/+Q3K/qrDFG
         WB/f7niJ6A68oy0oa8Z5XE4PNDUr4w408L4Z5HO3wET2NXFGI3JHi3x80WhsDDIPl1jc
         AjA3N7e2F1beWpDnEzobiSzeqUzn0XyFEtTucpIrHEF6VSZmhDXIOHv4PdyF4zvGJ2al
         7CuA==
X-Forwarded-Encrypted: i=1; AJvYcCVVk8Y4FCfDeqUyzmthCOESQ6jLBfIAbYdu/FL2ymDiQvtoYoKt7vbSB4d/kT98M7U/WapLRLvF12zBUYrr7Q2H@vger.kernel.org
X-Gm-Message-State: AOJu0YwWJqoXkspUq+10NMVsA6O+oERyUc2wi7bKqzSMRgbUYPdCXRmx
	q6lbLLb8a8TaZQBu1+Nm8QG4tY13fpJx2CmtWyhyBClxfBiV7qe4G89JQQFLpzVeo4LIQd+VTjC
	JbYMfpXsVXrYJoxbfWDj95dcUy2yv/4cj8e5UPPGV1Q==
X-Gm-Gg: ASbGnct7RI6n4hlET/G+Bn1B8OBq0hHI+AO5ZsdTnUJifoSeb2aqdm0fxo/5LfAXbLC
	lS04i1C+gtiShH4jHNA7IlhAU8xYswDtgIAsMJXGb35GT7ifIsmHEhvJpZR+FaT9/8fk3MaU61/
	ADcftfpuRaelYmO4zDmN9JlKNLwllKIyBWYwF13TjMF/ayUwBg/epQj1Sbcr8KhAgvYot4DN4TX
	mY1lQ==
X-Google-Smtp-Source: AGHT+IGnpxZ/kYqFsSq4j6qp84vLjWxNulzEhZc0i1z/5c6tyzkSQMkPM59ws5hVqdCe/nWfEYyFEbx1JOZa0jQG5i8=
X-Received: by 2002:a17:907:948d:b0:ad2:4c38:5a22 with SMTP id
 a640c23a62f3a-ade897f338cmr25361966b.51.1749577001063; Tue, 10 Jun 2025
 10:36:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603100808.1074812-1-arnaud.pouliquen@foss.st.com>
 <aEb8XbhY5dR__GM-@p14s> <7850c6f4-6a6f-4934-895d-9ec0688cda2a@foss.st.com>
In-Reply-To: <7850c6f4-6a6f-4934-895d-9ec0688cda2a@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 10 Jun 2025 11:36:30 -0600
X-Gm-Features: AX0GCFtaU9fLocUtXIXHBOEkqczV71_1sopLG6zbwgW4ITB5pILObesRDc6IzW8
Message-ID: <CANLsYky=AAnQ3P6J9E9R1=ufVKpGniiVTkfSeaq5J_7E=qN65g@mail.gmail.com>
Subject: Re: [RESEND PATCH v16 0/6] Introduction of a remoteproc tee to load
 signed firmware
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Jun 2025 at 10:33, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Mathieu,
>
> On 6/9/25 17:23, Mathieu Poirier wrote:
> > On Tue, Jun 03, 2025 at 12:08:02PM +0200, Arnaud Pouliquen wrote:
> >> Hello Bjorn and Mathieu,
> >>
> >> I am resending this series after waiting for over two months for Bjorn's
> >> feedback, despite a prior reminder.
> >>
> >> Please could you coordinate between yourselves to determine who will continue
> >> reviewing this series? It would be greatly appreciated if the review could
> >> proceed within a more reasonable timeframe.
> >>
> >> Thanks in advance and best regards,
> >> Arnaud
> >>
> >>
> >> Main updates from version V15[1]:
> >> - Removed the rproc_ops:load_fw() operation introduced in the previous version.
> >> - Returned to managing the remoteproc firmware loading in rproc_tee_parse_fw to
> >>   load and authenticate the firmware before getting the resource table.
> >> - Added spinlock and dev_link mechanisms in remoteproc TEE to better manage
> >>   bind/unbind.
> >>
> >
> > Have all pending issues been resolved or is there still questions about some
> > aspects of the design?
> >
>
> No pending issues on my side.
>
> In terms of design, I resend an equivalent of the V13 design incorporating
> Bjorn's comments on V15.
> The pending questions are:
> - is that V13/V16 is aligned with Bjorn's expectations[1].
> - are you also aligned on this design even if you proposed an alternative that
>   implemented in V14 and V15
> Few details on the V13/V16 design:
>
> The main point of discussion is the rproc_tee_parse_fw() implementation.
> In V13, this function loaded the firmware and then parses the resource table.
>
> You proposed an alternative, to add a new rproc->load ops
> in the remoteproc core instead (implemented in V14 and V15).
> Bjorn expressed concerns about this and proposed a solution that, from my
> understanding, is equivalent to the V13 implementation.
>

As far as I can tell, the only difference in this revision is the
loading of the firmware as part of rproc_tee_parse_fw().  I haven't
followed the thread but I am sure Bjorn had a good reason for that and
I am in agreement with this approach.

> Thanks,
> Arnaud
>
>
> [1] https://lkml.org/lkml/2025/3/5/906
>
> >> More details are available in each patch commit message.
> >>
> >> [1] https://lore.kernel.org/linux-remoteproc/20241128084219.2159197-7-arnaud.pouliquen@foss.st.com/T/
> >>
> >> Tested-on: commit 0ff41df1cb26 ("Linux 6.15")
> >>
> >> Description of the feature:
> >> --------------------------
> >> This series proposes the implementation of a remoteproc tee driver to
> >> communicate with a TEE trusted application responsible for authenticating
> >> and loading the remoteproc firmware image in an Arm secure context.
> >>
> >> 1) Principle:
> >>
> >> The remoteproc tee driver provides services to communicate with the OP-TEE
> >> trusted application running on the Trusted Execution Context (TEE).
> >> The trusted application in TEE manages the remote processor lifecycle:
> >>
> >> - authenticating and loading firmware images,
> >> - isolating and securing the remote processor memories,
> >> - supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
> >> - managing the start and stop of the firmware by the TEE.
> >>
> >> 2) Format of the signed image:
> >>
> >> Refer to:
> >> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57
> >>
> >> 3) OP-TEE trusted application API:
> >>
> >> Refer to:
> >> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h
> >>
> >> 4) OP-TEE signature script
> >>
> >> Refer to:
> >> https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py
> >>
> >> Example of usage:
> >> sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem
> >>
> >>
> >> 5) Impact on User space Application
> >>
> >> No sysfs impact. The user only needs to provide the signed firmware image
> >> instead of the ELF image.
> >>
> >>
> >> For more information about the implementation, a presentation is available here
> >> (note that the format of the signed image has evolved between the presentation
> >> and the integration in OP-TEE).
> >>
> >> https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds
> >>
> >> Arnaud Pouliquen (6):
> >>   remoteproc: core: Introduce rproc_pa_to_va helper
> >>   remoteproc: Add TEE support
> >>   remoteproc: Introduce release_fw optional operation
> >>   dt-bindings: remoteproc: Add compatibility for TEE support
> >>   remoteproc: stm32: Create sub-functions to request shutdown and
> >>     release
> >>   remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
> >>
> >>  .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
> >>  drivers/remoteproc/Kconfig                    |  10 +
> >>  drivers/remoteproc/Makefile                   |   1 +
> >>  drivers/remoteproc/remoteproc_core.c          |  52 ++
> >>  drivers/remoteproc/remoteproc_internal.h      |   6 +
> >>  drivers/remoteproc/remoteproc_tee.c           | 619 ++++++++++++++++++
> >>  drivers/remoteproc/stm32_rproc.c              | 139 +++-
> >>  include/linux/remoteproc.h                    |   4 +
> >>  include/linux/remoteproc_tee.h                |  90 +++
> >>  9 files changed, 935 insertions(+), 44 deletions(-)
> >>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
> >>  create mode 100644 include/linux/remoteproc_tee.h
> >>
> >>
> >> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> >> --
> >> 2.25.1
> >>
