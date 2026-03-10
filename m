Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA07E2F0C7E;
	Tue, 10 Mar 2026 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155889; cv=none; b=pL7BABh/N4h/tPphRR0UhPZhboaTPdYS+awEtcNt7rJyRz0kAAZKiN/TEQo8QpeofcVxYeAJ2+AI70XbDrtWZrKNIfg0oI/oEX0z5v7XLDLhh77Mds4vlYvF8+9h+LtflkhVgLvPH3aujjdaTn5YOF7J+vzMeH7UijtjsGTZjxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155889; c=relaxed/simple;
	bh=XIw9pqpUWIeq3yDxTXxxYJ6+f/jDlw5eFm/WTH3oCiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kahwneoewiz13/lDa+6UwmUd/vGrgumu9qiLJEU3iyI/CSRfx1GkmX4xiG0CP1u5yWCIaD22DS0vHm1jK1ii2CZ3UurfisFTpUlizTrjnj6K3q75qkr4QiitzToGGOvTCq/dTwfj/KXyCyeDJmQfP/KXGcRQ0z6NBNBJlmit7LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0MFyXz9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0MFyXz9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08DA7C2BC86;
	Tue, 10 Mar 2026 15:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773155889;
	bh=XIw9pqpUWIeq3yDxTXxxYJ6+f/jDlw5eFm/WTH3oCiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0MFyXz93cEAEqNTcTWR1jqicCK8xxXJZN/8WYq3aghC5ct8IymPbzVMSTP9uJnW5
	 F7LM0XooUEucp6mXLB10WGmvUIiShNRf9IxqITR3ljeeBnhcJ7fdsPXX42z+5DI/mH
	 iXXTJYQr90ModKovVwBI8HlAOWFRzf4TBHAV//p4DJ1TlXg5lP+lAcIf6agkFRlTb3
	 V0/UADtXeeLftUPpnvIetO1+CFGYTx3QvGGfLFe0UhrkMA33egvcGLjjTf2RkVzvcm
	 gbpS6kODF96S4GKmNi+g80yBaWqs+9mdddhAJBY/sgzo6dR1XvSPEVlQJaz0+bxjEP
	 JfRnmZH65rloA==
Date: Tue, 10 Mar 2026 15:18:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
	Mathieu Poirier <mathieuu.poirier@linaro.org>
Subject: Re: [PATCH v2 4/5] ASoC: qcom:: Constify GPR packet being send over
 GPR interface
Message-ID: <8499f2ba-f382-4cc8-bd27-b775219bded8@sirena.org.uk>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
 <20260310-rpmsg-send-const-v2-4-0e94c5db9bf4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AS+M3oS+e+7iUDOB"
Content-Disposition: inline
In-Reply-To: <20260310-rpmsg-send-const-v2-4-0e94c5db9bf4@oss.qualcomm.com>
X-Cookie: A fool and his honey are soon parted.


--AS+M3oS+e+7iUDOB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2026 at 12:22:38PM +0100, Krzysztof Kozlowski wrote:
> gpr_send_pkt() and pkt_router_send_svc_pkt() only send the GPR packet
> they receive, without any need to actually modify it, so mark the
> pointer to GPR packet as pointer to const for code safety and code
> self-documentation.  Several usersof this interface can follow up and
> also operate on pointer to const.

Acked-by: Mark Brown <broonie@kernel.org>

--AS+M3oS+e+7iUDOB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwNioACgkQJNaLcl1U
h9A6IAgAhm8FHbxPDGSY7xlMzneUZ56MJqJMAxai8u7h2VB+HRv7t/osrrSgs+eV
IOJM5ZSrW5Ayh1fQB6oJR22Mf5XLgxWFceEgQST5ZLepvrRacQg1sXGjnEh6p0yF
mux1im7ljE0arSzYV2kgYaOxwHRPRiz62g7yBDd8eweU2NpQqCV+d80wJ3YgQI4A
7M/CC5jZY6s/gCOuNySpsp0Z6nnlyDvDP5htfud/brHnj+bb5LsSS6+KAM7uYPwv
sN7Ywkq68wsEVI+O5bBtwXGvW1C6Ucga9IqbX7N1ZgPpYObwQCChJq27ekcw/SAE
WFepehfDBjcnivcMjQl9HBc5xRdxQQ==
=9edh
-----END PGP SIGNATURE-----

--AS+M3oS+e+7iUDOB--
