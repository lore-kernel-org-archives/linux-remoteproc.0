Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BCC146588
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2026 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776255583; cv=none; b=QKdebo7GXksd1EUbMPcfWdqk3qL+jMpLf6I5h5U+s3wU6Qf/aWZbeF5Fgb9edm0pDakilxI4M7UQ6garcJ2Q1CvQvWfI4brrLpGwdQjB52h05zyjmgMAeebIf40XnsQ59XMMB6N9CYSFM7G7gFJFvsaXO5Cjkl3mWFgfsFtSRUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776255583; c=relaxed/simple;
	bh=xZ0T4yzAgv7b5+PwCNimP1qrM9469B2e+xvejj7R0ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qucg3FVHPsgrJ222PgWVuem8kmOsRIbM+8/z+emISq6o6BBatc7lQd7YC1qKlSgfkCdeq/KOvibST7PVOIRfYOFDPb7gUsrcdmajC4GAFLveN0tL0q7MFeKkfXC09Tuv9fuvzpR+PUP1ERqDlCK0ct3Yl5+Lg1Q/CwDUbsouKaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=suNrZoYG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="suNrZoYG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AD5C2BCB4
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2026 12:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776255582;
	bh=xZ0T4yzAgv7b5+PwCNimP1qrM9469B2e+xvejj7R0ok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=suNrZoYGWA3jQ/5vT8KC+r3fqb2DvhFQblQlXpNMfAuzmIoDj13LOGInwoTYEiq33
	 Cs727I4ai145VCz65qJwxaN1CoUYTVrtURWQSRXcgHEmGv8fu+uHeATsHRPre/LBtO
	 AMmtDqme2YhVT7d9irY+axsa8Ns3FagHizFdkQBYE/lH+jlEoIRFADppqkESfuPKfR
	 xaCGPuzFNISOCkEPCq4mxPFQ2PTrFARqtMcIRnGHRZkl0H1iJBTpBMIVzgSDgSgsgJ
	 rNwtRrfTK8Emk5KHviz5QsTt1aobAmcctntC7/Z7hWA8hBQVouiQrPh04E0cKgqMGY
	 Epwr4/Ki+lMeg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso9148521a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2026 05:19:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/lmPD5bCXI7Gw1VTVgBm6yU8BFdMWV79Fb9AXGenWTzUEvc+o0OUhbh1NHGs1zUiZCmfEv1sK+6VayHFjLV53e@vger.kernel.org
X-Gm-Message-State: AOJu0YxPEI/ogzrD/xA+wWFO1cPkxdQ5TMMpxcbryqgz/Z7ZT/KDhjww
	VHMWQRlVX/fd73EM9rAESi+HHL2X2wVzgiJ8bgmQiMGX30WOJAQODnaacLgPePeeYRhNVi3oZkb
	EYYcfhbBkRuY2uXiDBSzkCnn4yLxgzQ==
X-Received: by 2002:a05:6402:1465:b0:671:e912:885e with SMTP id
 4fb4d7f45d1cf-671e912912fmr3360745a12.9.1776255581409; Wed, 15 Apr 2026
 05:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414161558.2579920-1-ben.levinsky@amd.com>
 <20260414161558.2579920-2-ben.levinsky@amd.com> <774a8e9f-cfd9-4584-aaf0-2fd1189f65e8@kernel.org>
 <e82faa64-22fa-4dba-8cde-f02cf9f95e25@amd.com>
In-Reply-To: <e82faa64-22fa-4dba-8cde-f02cf9f95e25@amd.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 Apr 2026 07:19:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKE1G+sdJnSZazVVyy=gV6iAz=HgtCOBXGz31qdzbUShQ@mail.gmail.com>
X-Gm-Features: AQROBzC1fPJTosTVs6GDYoMZUqJgsG4LML4H4W00sv4JdDSdDEmNCyhwHBthKaY
Message-ID: <CAL_JsqKE1G+sdJnSZazVVyy=gV6iAz=HgtCOBXGz31qdzbUShQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: add AMD MicroBlaze binding
To: Michal Simek <michal.simek@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Ben Levinsky <ben.levinsky@amd.com>, andersson@kernel.org, 
	mathieu.poirier@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tanmay.shah@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 1:16=E2=80=AFAM Michal Simek <michal.simek@amd.com>=
 wrote:
>
>
>
> On 4/14/26 19:53, Krzysztof Kozlowski wrote:
> > On 14/04/2026 18:15, Ben Levinsky wrote:
> >
> > A nit, subject: drop second/last, redundant "binding". The "dt-bindings=
"
> > prefix is already stating that these are bindings.
> > See also:
> > https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicet=
ree/bindings/submitting-patches.rst#L18
> >
> >> +---
> >> +$id: http://devicetree.org/schemas/remoteproc/amd,microblaze.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: AMD MicroBlaze remote processor
> >> +
> >> +maintainers:
> >> +  - Ben Levinsky <ben.levinsky@amd.com>
> >> +
> >> +description:
> >> +  MicroBlaze remote processor controlled by Linux through the remotep=
roc
> >> +  framework.
> >
> > Describe hardware, not Linux frameworks. IOW, Linux framework is here
> > irrelevant.
> >
> >> +
> >> +  The executable firmware memory window is described in the
> >> +  MicroBlaze-local address space by the node's reg property and trans=
lated
> >> +  to the system physical address space with standard devicetree addre=
ss
> >> +  translation provided by the parent bus node's ranges property.
> >> +
> >> +properties:
> >> +  $nodename:
> >> +    pattern: "^remoteproc@[0-9a-f]+$"
> >> +
> >> +  compatible:
> >> +    const: amd,microblaze
> >
> > microblaze is architecture, so this feels way too generic. You need SoC
> > specific compatibles and I suggest do not reference architecture, but
> > name or the function of the processor, if there are such.
>
> I have been arguing internally that I think when you look at driver itsel=
f it
> can be pretty much generic loader for any firmware and doesn't really mat=
ter if
> target subsystem is Microblaze/Risc-V/whatever based. And I was suggestin=
g them
> to use more generic name.

Generic to AMD though, not everyone, right?

I agree it probably doesn't matter what the processor arch is. The
compatible just needs to be specific enough when there's some
quirk/feature in the interface to the operating system, that we can
distinguish the specific implementation *without* a DT update.

> Because at the end of day reg property is pointing to location where firm=
ware
> should be loaded and gpio is a way how to start that subsystem and there =
is
> nothing Microblaze specific.
>
> I can also imagine that the same driver could be extended with optional p=
ower
> domain, power regulator and clock properties if there is a need to drive =
them
> before subsystem gets out of reset.

That never works because then there's timing/ordering constraints for
enabling/disabling all those resources. Then we end up with a never
ending stream of properties added which results in a poorly designed
binding.

Rob
