Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EB92749ED
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Jan 2026 22:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767392260; cv=none; b=kAYt7r6RTfCEwnKlONEbKsUM1RKaVu6VZe3y58w46o1AmrG2jKKEoHegIiZWqNQyRS+zqgJ850U6Cph/eQq8gk/fyimeF3gG6gRIAZ1E6IqCqPQJYKIrhGYKkw6UJL3hi2CgNGxRx43VbvKbAYok02OI3JqI8dw8NUkoleOsZBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767392260; c=relaxed/simple;
	bh=/64Co2q0kgEgA6DPpVmvrLqtt4+bKlfMdoKNXVNCcsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scW7NigYNO6K4cdDc2BRNvRhe7WCPfb4xR0fE8cSIkOzgXXOicB07RH4XAYRBmitqY5j2uDX+dM/6nFbZa4WCWegETe0PVfrXbNkAzCa1ZpeHq16FnlTLSGlnINVaQ4LvIh4l9VVZ5TVtdVtI4n3WclplgqJ9TvFtyLis4VAhsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ge2fF73i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ge2fF73i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2525C2BC87
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Jan 2026 22:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767392259;
	bh=/64Co2q0kgEgA6DPpVmvrLqtt4+bKlfMdoKNXVNCcsQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ge2fF73iJ8fd9je/5EvWRvXS4+eNAXKRDPzkWl71vlZSnTL/QfKna/aIUVBrNzqh5
	 mDsdGxhIVjOAF5DgyQXjyPdkWInWTLYyR9nBQBjvEYKXdK4AlCDsxA4DRs7FKwJd55
	 qbNGH1+8COzIcaBwqUZtXwBOXEyk4P7MwVgy80b4xpW7IdeVJUU16yVWcdTMFVs1VE
	 a/shbiUuWL8wYX6p4iaLWpnQh2+AczJFAcfhA1YoN3SzJA9UdLIX7SN1jvxiC3iOfj
	 7D4GSVWzrtB2v8A78o2IxK2poTFA4PCSHN/pB4Gh1eYAhTxFCE8mUEEVm572e5YK5f
	 d5bdHvqxa8TAA==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b728a43e410so2384628866b.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 Jan 2026 14:17:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMCZ4wmPCPI13jLwDz3QJGpVwVN6hp+R1/8qLPjR0xo4IcsLWNdiZusiFAYRIAt1vlxr1z/GrEGjA/+ZxXwAIF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtdk/kzji1bj2QbRilUvrPteR4j80neX50unbHU5SvbGDqh+di
	lC/Pt2B8op9sBdMWmIxfxkWfc5VPMj5BnEEpB8RURdItY3Sb7ryA0z+OL13UylAkAmLr3e8W3AU
	decWDtuqRP6mMXsqNfVt/4RaFKrMnDw==
X-Google-Smtp-Source: AGHT+IGcdjYMdq8WHlapJ12+Pohp79IeQ6Qp00t62ofYPur0Xu5Cyh0Zdwx3rcPrWR7fro3HFhzV7izpL+ysUdN6FT8=
X-Received: by 2002:a17:907:da17:b0:b83:3770:a0e4 with SMTP id
 a640c23a62f3a-b833770a15emr2280910966b.34.1767392258434; Fri, 02 Jan 2026
 14:17:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com> <20251229232530.GA2753472-robh@kernel.org>
 <aVOzHWmlJ-eneS-2@sumit-xelite>
In-Reply-To: <aVOzHWmlJ-eneS-2@sumit-xelite>
From: Rob Herring <robh@kernel.org>
Date: Fri, 2 Jan 2026 16:17:27 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
X-Gm-Features: AQt7F2qSpJIFr1cZ7Ak2PMJj_kJpZOMaYqr6WPt7b6SXNB2GqwyfYzNGk02nLo4
Message-ID: <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
Subject: Re: [PATCH v20 1/6] dt-bindings: firmware: Add TEE remoteproc service binding
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 5:10=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Mon, Dec 29, 2025 at 05:25:30PM -0600, Rob Herring wrote:
> > On Wed, Dec 17, 2025 at 04:39:12PM +0100, Arnaud Pouliquen wrote:
> > > Add a device tree binding for the TEE-based remote processor control
> > > service implemented as an OP-TEE Trusted Application identified by
> > > UUID 80a4c275-0a47-4905-8285-1486a9771a08.
> > >
> > > The TEE service node is a child of the "linaro,optee-tz" firmware nod=
e and
> > > acts as a container for remoteproc devices that are controlled via TE=
E.
> >
> > Is this generic for any remoteproc device or just ST's remoteproc. Look=
s
> > like the latter to me.
>
> That's true, the DT description of the remoteproc subnode is very
> specific to the vendor which in this case is ST.
>
> >
> > > In addition, the "linaro,optee-tz" binding is updated to specify the
> > > '#address-cells' and '#size-cells' values used for child TEE service
> > > nodes.
> >
> > I'm pretty sure I already rejected per service/app child nodes for
> > OP-TEE when its binding was submitted.
>
> That was the reason to have discoverable TEE bus in first place and I
> have been motivating people to dynamically discover firmware properties
> rather than hardcoding in the DT.
>
> > If we do need something in DT
> > to define some resources, then can't we have some sort of
> > standard/common communications channel? I don't care to see some sort o=
f
> > free-for-all where we have every vendor doing their own thing. OP-TEE
> > needs to standarize this.
>
> I suppose this requires a wider scope work as you can see the DT resource
> dependence from here [1]. By standardize communication channel, do you
> mean to say if adding an alternative backend to fwnode for TEE in
> parallel to DT, ACPI or swnode is the way to go for discovering fw
> properties?

No, not at all.

> Or do you have any other suggestion here?

What I mean is why doesn't the TEE define the communication channel
(mailbox+shmem and notification interrupt) rather than each TEE app?

More generally, is having TEE apps depending on random DT resources
really a box we want to open? Is the next thing going to be a TEE
clock/reset/gpio/power provider? Where do we draw the line?

Rob
