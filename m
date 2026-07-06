Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EE53ADB92;
	Mon,  6 Jul 2026 10:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333895; cv=none; b=GKyH83M88+uDfHJdkGjgwCVIXKywxAdb04grr0l0m2HG+aXNmNXY048dA+1Zk88QjuAJDuEf61fk3cBZm/eW+NxpfE6Syq4S+YOLuKFRTeRTEq3NyNaz5hxyTYTyD5yBYId+FBquH2gneJq7HiUZvNlA0v+aypBxfaNt7jLQUGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333895; c=relaxed/simple;
	bh=QM5TEBC3oCQOd1+ap0eHtOEqNlPPllrJjy42SngC584=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hQaTq65mxyrAmVW6c/Yuxqvp4e2IRlncHvF3+RAETy5blsakdtGD0GvXqwm7CXez9AkPlsFWWvfKI33lUDX++Qg5f7YpUn5GqzumDixvdidykCHdk1hYmfjRXvMm6a3DHqdXU/zwFi6nefkNIU3LgjaiLRtn1EAeCFKNosKbclc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9EAD9200BB3;
	Mon, 06 Jul 2026 12:31:22 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wggbi-000OLc-1k;
	Mon, 06 Jul 2026 12:31:22 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wggbi-00000000BGf-1v8z;
	Mon, 06 Jul 2026 12:31:22 +0200
Message-ID: <814f72ae1f039b6ae13599c11f9916f4eeaa634e.camel@pengutronix.de>
Subject: Re: [PATCH] remoteproc: ti_k3_r5: Drop redundant NULL check on
 reset control get
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Bjorn
 Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, 	linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 06 Jul 2026 12:31:22 +0200
In-Reply-To: <20260705172353.119031-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705172353.119031-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On So, 2026-07-05 at 19:23 +0200, Krzysztof Kozlowski wrote:
> devm_reset_control_get_exclusive() does not return NULL (only valid
> clock or ERR pointer in case for non-optional get), so simplify the code
> to drop redundant IS_ERR_OR_NULL().
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remotepro=
c/ti_k3_r5_remoteproc.c
> index 04f23295ffc1..b1d04d082e44 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1074,11 +1074,9 @@ static int k3_r5_cluster_rproc_init(struct platfor=
m_device *pdev)
>  		}
> =20
>  		kproc->reset =3D devm_reset_control_get_exclusive(cdev, NULL);
> -		if (IS_ERR_OR_NULL(kproc->reset)) {
> -			ret =3D PTR_ERR_OR_ZERO(kproc->reset);
> -			if (!ret)
> -				ret =3D -ENODEV;
> -			dev_err_probe(cdev, ret, "failed to get reset handle\n");
> +		if (IS_ERR(kproc->reset)) {
> +			ret =3D dev_err_probe(cdev, PTR_ERR(kproc->reset),
> +					    "failed to get reset handle\n");
>  			goto out;
>  		}
> =20

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
