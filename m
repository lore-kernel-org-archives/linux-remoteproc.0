Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342B615747D;
	Wed, 25 Sep 2024 08:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727253051; cv=pass; b=VoqADXi6UCjnz6pWwwTnYjGLUFd78pi5OeUC79DUaTZu+vvTFdig+veRfxqXM3EI1hJIKAQd3//cmQL4dKf3EBD/nu4eDSo2wZZctnigndZKSzfgbH2EmOt4TQT79hYRO7Q+vfkrzwfdcatvF8WcBg+ig3GtKfhK+H9RkjfC73g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727253051; c=relaxed/simple;
	bh=CALIBjLLhqi9fJYnDECguRBWcFkZ4OfnWGTV7ZoPXbw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gnWlqluZ1zaoPh7j5j2wgSZ/tUeDqKBecZ0fM2vr35BMBsB1EVUupXkCo3F3zykZDAz1tbZucQ59QMujXkZ6G+wGsp760VhQiqFqOnQZMyN59pDd9Ajq3am17EGafwFG5S0s2uVFv60ju6J8+nOT9rDdOwBW9bf5fFaIIhdcb/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b=ThlV66rs; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b="ThlV66rs"
ARC-Seal: i=1; a=rsa-sha256; t=1727253030; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M8fE48b+deZ8NtdPRZS1ea5o6I+QgcGPk77MbHjBM3hKNWQU3QWYv3ljfMFiSZmNDgZ0Ea7NmgylW+2SrpGGJhBbiZr69xFmJYDeMjbd0neE7ighvBD3zvxgwSD9RtMq/bsniAWQVVmXkD6CpcVjZQE76hVzNhFc5Vo78jkvIUw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727253030; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CALIBjLLhqi9fJYnDECguRBWcFkZ4OfnWGTV7ZoPXbw=; 
	b=DfRRQtKBehOi+MJOp4PY9qX7qOptMVzSM13yurZVs8roOCSnRNXXNdfpwQ/ePkhzLsdU/acNrpkPrcO5byWeLg4Vc+GVErFceOJdM6FVDfhPWDqWbiroOaWvIcHTD+zq57+Skd4uj7BMF9826IIXtxgAWbsZpNQgq4uDSwlVpw4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727253030;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=CALIBjLLhqi9fJYnDECguRBWcFkZ4OfnWGTV7ZoPXbw=;
	b=ThlV66rsRQ84QuEGfXktbL+4bwAq6oKx3BhkZcVZ2OqChfe6OWnGaNMSPR4jkNQC
	sTmaxAYBwYohXHYR8oDbY842Etugjw/kMGXvcZURHI8az5bzHcP2NTDJoKHXCAY35uJ
	0SnT9OcPjM4fG/ih5w+O8EMggOdFWn4tOEFpemFo=
Received: by mx.zohomail.com with SMTPS id 1727253028661252.37179217812093;
	Wed, 25 Sep 2024 01:30:28 -0700 (PDT)
Message-ID: <c1b78a60a280d95aa5a9e69c82a8b4d3ce9bd6c9.camel@collabora.com>
Subject: Re: [GIT PULL] remoteproc updates for v6.12
From: Martyn Welch <martyn.welch@collabora.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Bjorn Andersson	
 <andersson@kernel.org>, Hari Nagalla <hnagalla@ti.com>, Andrew Davis
 <afd@ti.com>,  Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Peng Fan
	 <peng.fan@nxp.com>, Beleswar Padhi <b-padhi@ti.com>, Zhang Zekun	
 <zhangzekun11@huawei.com>, Naina Mehta <quic_nainmeht@quicinc.com>, Jan
 Kiszka	 <jan.kiszka@siemens.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,  Rob Herring <robh@kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>, Tengfei Fan <quic_tengfan@quicinc.com>,  Udit
 Kumar <u-kumar1@ti.com>
Date: Wed, 25 Sep 2024 09:30:24 +0100
In-Reply-To: <CAHk-=wieXpmx=+gEuhQSEEZLyQHFLDk5=59j0OtOF==mQdVjYA@mail.gmail.com>
References: <20240924044741.3078097-1-andersson@kernel.org>
	 <CAHk-=wieXpmx=+gEuhQSEEZLyQHFLDk5=59j0OtOF==mQdVjYA@mail.gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Tue, 2024-09-24 at 12:31 -0700, Linus Torvalds wrote:
> On Mon, 23 Sept 2024 at 21:44, Bjorn Andersson <andersson@kernel.org>
> wrote:
> >=20
> > remoteproc updates for v6.12
>=20
> Grr. I didn't immediately notice this new Kconfig warning, so now
> it's
> in my tree:
>=20
> =C2=A0 WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
> =C2=A0=C2=A0=C2=A0 Depends on [n]: MAILBOX [=3Dy] && (ARCH_OMAP2PLUS || A=
RCH_K3)
> =C2=A0=C2=A0=C2=A0 Selected by [m]:
> =C2=A0=C2=A0=C2=A0 - TI_K3_M4_REMOTEPROC [=3Dm] && REMOTEPROC [=3Dy] && (=
ARCH_K3 ||
> COMPILE_TEST [=3Dy])
>=20
> this happens with a regular "make allmodconfig" on x86-64.
>=20
> This seems to have been introduced in commit ebcf9008a895
> ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem") that
> added the TI K3 M4 remoteproc support, which does
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select OMAP2PLUS_MBOX
>=20
> but does not actually contain the proper dependencies that
> OMAP2PLUS_MBOX requires..
>=20
> It's in my tree now, but please fix asap.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Linus

Both myself and Arnd have submitted patches to fix this. It seems that
either have been applied...

29 Aug 2024 - [PATCH] mailbox: omap: Enable COMPILE_TEST for OMAP2+
Mailbox framework support
https://lore.kernel.org/all/010201919d8b298f-dd1585dd-7c4d-4865-9483-ff6cd7=
399a90-000000@eu-west-1.amazonses.com/

9 Sep 2024 - [PATCH] mailbox, remoteproc: omap2+: fix compile testing
https://lore.kernel.org/all/20240909203825.1666947-1-arnd@kernel.org/

Martyn
