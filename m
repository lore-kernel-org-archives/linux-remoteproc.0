Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CD62FFDF7;
	Thu, 19 Mar 2026 08:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907647; cv=none; b=ZMMbpp9NPk7LxyeukTR9yiAk2ptMhGsboyZiqdGP+eN79X16jA1IkmzI8q8rooas2+YuJ/JvTP9i1JIYq9EPxLkBKvMbsl7n9vFI7GH7/vm4xz90CQH8HtdpDpLBkRXITQpQVg2QRcyTeL2xnb4ss+3RYpSuCilM30HAQSflqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907647; c=relaxed/simple;
	bh=/eggGJc8w0dVMpTXWMeYMFm/znwA+edXs/5l6qyW4PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9PhByz+XzRxOsnLjhDvY1ZsSYkipS9PgqLOMr5KttjIrdleaYqUCKds5l0yTFg0KMqvnWcuVLnohy2y++EWScPHxRpXQT1hyV2e4ExK3tZpI8wmf3eBRsKJqkzH0TETx779zu8xt41H1C3/X7aLVcHE1Nkmi9h8/WY48hJAuxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yqv2xAS9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yqv2xAS9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77302C19424;
	Thu, 19 Mar 2026 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773907646;
	bh=/eggGJc8w0dVMpTXWMeYMFm/znwA+edXs/5l6qyW4PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yqv2xAS9fjzDIa7+qFMFWEC3da1aX7vqYq3Nm7gvhUEnG0sIodlyG5dShrFBWRyZb
	 kcCgtrw/+Zsppc5EMEN2Pz2HFIfNmMbs0Rid6utUuSOgXEZfT2tty4+Q5480DeMcAO
	 cJZRPVTeSRVKHUyK5HdiJqua0tr12r0BGKFnU50su6MR+YRH78Za65A4Veqh57N1Sw
	 9dXnkVUTpeeHxIeY9p2gsfWrrV9YSYEgogVN6D1+cXz5vZeib1RfsN5b+31oUMWllR
	 wFRreAhlODAlh7IyNtSGCNaPekZgTtIVMjq1OMW9nzXYuu8yQRRP4GTeimdBVrpadm
	 1aRZZYmhSNzsQ==
Date: Thu, 19 Mar 2026 09:07:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v21 0/6] Introduction of a remoteproc tee to load signed
 firmware
Message-ID: <20260319-fiery-onyx-serval-aceb17@quoll>
References: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>

On Tue, Mar 17, 2026 at 07:03:21PM +0100, Arnaud Pouliquen wrote:
>=20
> Main updates from version V20[4]:
> --------------------------------
> To address Rob=E2=80=99s concern on v20concerning resource declaration un=
der the
> tee node, the device tree is now structured as follows,replacing the
> child-parent hierarchy with a phandle:
>=20
>     firmware {
>         tee_rproc: optee-rproc {
>             compatible =3D "80a4c275-0a47-4905-8285-1486a9771a08";
>         };
>     };
>=20

And what is the parent here?

>     m4: m4@0 {

What sort of bus do you have here (IOW, what does this 0 mean?)

>       compatible =3D "st,stm32mp1-m4-tee";
>       reg =3D <0 0>;
>=20
>       mboxes =3D <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
>       mbox-names =3D "vq0", "vq1", "shutdown";
>=20
>       memory-region =3D <&vdev0vring0>, <&m_ipc_shm>, <&mcuram2>,
>                       <&vdev0vring1>, <&vdev0buffer>, <&retram>;
>=20
>       interrupt-parent =3D <&exti>;
>       interrupts =3D <68 1>;
>=20
>       rproc-tee-phandle =3D <&tee_rproc 0>;
>       st,auto-boot;
>       wakeup-source;
>=20
>       status =3D "okay";
>     };

Best regards,
Krzysztof

