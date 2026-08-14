Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A521357D1E;
	Fri, 14 Aug 2026 05:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786685971; cv=none; b=WroVDUyGH5L5y/CEY7hF+TGv2CxLc9uutuVEK0sLqMV7xfpyOa/z5eHEP+vjamS6bn0nels8gjBCCK+8PCLF8UWECkpjtowi9RcDf0tffsWgOYgOQrlnhTtHtySxU1MBLwTG3mfq1Oi4fm/lOnAklZtcf4U3JHmpAgWWkKe4C0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786685971; c=relaxed/simple;
	bh=n+/mCu5MXIfLZIA9duZXHAFxTQ/lIOMeYuUImBdCYLM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=MvZg5CyjgP1nYbQHM0I3uEA6KSF9xN+GD9Za4/BbP3dREMMQKsVj1RO9K9o+KTdtJW6pnzs6y9N2wNVeKitJjhX+OFTdLU2FIekHpaRRr1ZdgvV7lrWV9b+sITH0VA3oPNVBmYpz9sT4tgjNsttoonIU6V7h0bYoQ/jSpWRi01s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqT/WG+i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqT/WG+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBBE1F000E9;
	Fri, 14 Aug 2026 05:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786685969;
	bh=n+/mCu5MXIfLZIA9duZXHAFxTQ/lIOMeYuUImBdCYLM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=EqT/WG+iAJiZ4lsQlnZVn5/rEEHSmxZVHMIk9+lY7TtDk+WROfzizkn34qRWjx9gG
	 4YU9zUIkhbXTMSujzDIEZ11cGWbpNWI03MXbwVYQKMD46vkLNI3dVXL4tPg/yOaRj6
	 26rcFWa62fqWU0tRQT/Rc4PoJhlw9uXtLGOk8ArbNtOUR7pHW9KH4sZWPFaLa5xhJ0
	 zINablo359KR70GFO67OFq0aKdEEWxX4NAXFd3w+G+HEswqeS/AOL5M9AEF1+iGel6
	 8W7Ph6zT877Ro2OQGjKnkLn+l4O7JwAKCkb2Au01VCT3GOzYFx1OjL6f1Bbq1bDlvx
	 T3I23lWVjr2dQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260726-ti-keystone-gate-clk-v1-1-5b2449bc31ee@gmail.com>
References: <20260726-ti-keystone-gate-clk-v1-1-5b2449bc31ee@gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: ti,keystone-gate: Convert to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
To: Bhargav Joshi <j.bhargav.u@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Murali Karicheri <m-karicheri2@ti.com>, Rob Herring <robh@kernel.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>
Date: Thu, 13 Aug 2026 22:39:28 -0700
Message-ID: <178668596821.5897.10348773029681902463@lazor>
User-Agent: alot/0.12

Quoting Bhargav Joshi (2026-07-25 13:04:08)
> Convert Texas Instruments keystone PSC clock binding to DT schema.
>=20
> The vendor-specific 'domain-id' property is intentionally kept without a
> "ti," prefix to preserve existing ABI since driver and existing board
> file use property without "ti," prefix.
>=20
> Also update the reference to this binding in ti,keystone-rproc.txt to
> point at the new filename.
>=20
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---

Applied to clk-next
