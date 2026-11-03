Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728204;
	b=dqELFVpXzEIEbPionh7WTVwm2yWFmdf/Mdjgb2+PnqwLd8r0xdZlW/+XxnwidjPEFRuQ
	 MH1p+8DiPCZ3mQTLK3CdAJ1GwcSElhOZoCaCu74qfrHaCQR2cebGn8IGACme8L6QAOBWX
	 o8Ld3hs2koSGy8UkELX/ZXWNdIify085w6PZXyzbqVjPEKft3C7TZNYmhw0JU09Ct/qv0
	 Rp99/Je15aHGpgDiaK/+oDlr6IGJwoy6U/XbUOkgfIe4iToniWSQpVwVIPhmasuULVwaL
	 STAz0fPOGjZf8Gmq9yoa3PiKHZpNgQpvgEt0glNco+WeboREyvgryR1Nn3NmR4wX6qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EvBKZYbsyPjC/KbvTWeWl/x1jiG+4Pze5t2xnn/ZrCU=;
	b=kW/FNm+Cejh0jMl7wb91N33K1gkjXQNGd5HLGM5d2uA3hJqNJ+8MsykbqInXizUk2FGD
	 yQZ1jOfT8JHIhe0sJUT7wQTTo55Kb5qCluMoRO+Wq9L3jUw9ftg3fe+r0FOEnRSdCwzeJ
	 byOb33CXfLEEonEhc8pdd4RE8WDrAgqmeO0TvwG43aoyUP+Qp+6byvp/M52SfgM277lQ7
	 Vtj/nE0vw5+kBLo1HTtTSBq3tgRZAiUYdgi1T1xTitZWnBIJgX8WAP4pBb3IgAKMeU7Iq
	 M6MzK6GelIWN0W6LFsZ211JwRdUOdQiVAWECbMTku89/tkbZniyvhqz0wLH5Yhbq19w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="b/IyMV2b";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE3606A32C
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Nov 2026 17:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6FE3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b/IyMV2b
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so38271245e9.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Nov 2026 09:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793728201; x=1794333001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EvBKZYbsyPjC/KbvTWeWl/x1jiG+4Pze5t2xnn/ZrCU=;
        b=b/IyMV2bpaMVswQSzeQ1PZsZb2CjE54ozGqexHU8bBXqD0JQSLXMR2/ti16UV5NNr/
         TkCp/RRKQ+et3iOkt7F9Lcmm+kzMAdAdwfXYEPIGXYifNQNsT6zo1s9sEj2bXgHNOLBz
         z3E0FdH+CGHbPw5xzqc2TgyXastiegaTK7bvhEnrZNEpuxw0WJOE9+UPC6en3jn3FzPK
         hYJm9KYs539y/Qc88zeBN51oct/UcaOrtO/cekHyUj2nQm9jJAoneGqQIyXqtxn611wn
         1MoTbH5CD2JfN/+LIzLYRSrzDZfLjIJA5L4V2uJPecLnmUIZDYDjB8L7eH63+TAxK7qI
         sw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728201; x=1794333001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvBKZYbsyPjC/KbvTWeWl/x1jiG+4Pze5t2xnn/ZrCU=;
        b=1rEO5bW79rZm5/pN9CcSrIYt3vgIvTDkY1qj7Udn4OPdbSxamoqVu5ohLp62wQBYmb
         VCOx5h87izGvcaeJRaBtRT+0mFKpWq/rqDhigPd/mMFGUiadv1G1k9LMhFiLeNYPjmvd
         RHm7Qvkn09tnMl445kvsKbSEJTM7fFX6xc+1DDnGBEGOZswNpnuprzZajnY50NcxFSz5
         HuXQfI97a+dxtgOmtakLygbbbMAUfZBoN0nEeiiE2oG4xUVEk43fGkjrQiwPfZ1xC6uJ
         BQ3FDZaHv2U9a8+L5ROz9RNUx5jM1pKBcppk7c4SJhUk/Rt0HS9UcV/FUwYt2LZ1y/N2
         Bktw==
X-Forwarded-Encrypted: i=1; AKwUvBzXDC3seO+QHcfM5qaRfIUjhPu7Sa6vFWf5ZOzyO3nF+AtWimSyV86wwiBfFYjaJTxShcPRHyQk9uBmNdWrFWQj@vger.kernel.org
X-Gm-Message-State: APuU4Z/s9YUVJTQVD/bVLTHjn/10YkZgZrTiq9pi6x2wUKIP5Iomt4Fb
	85o78mDXhRfXs8qIsDRzKNh51ui8jZJE6AHEdOv7B1cQZBsTPcwltI3YkJKCWb3csqMKkPNL2KN
	hrFwGCKk=
X-Gm-Gg: AYBFou0KVTid7GAiJ2eV9wMiRwwGEUmOuuF0dzUDAokOmOPmT+yxYF0zznrlFWBvYWd
	zs6MIBMlxyjop3277s/pFuxTouzafJYobeEh60SYj1D/V6bRsuFqdfu67WTgkX10jlU8/04920c
	B4gyGy35/M0KO14Fm0dsP55mipwH5WCKWvv0WFwPj6UADiUOEA4UuyDVYUszjKKc4J2wS/gZo1/
	/J+MUC2g6Pu/cZMHUy1u9AG6M3vw7QkSpQN36iq17LDNyq6g6mHz2kQtFX56tN1u7u3n+DMwFsw
	/2wotG0xlJ8ej+e1aRsCZ8cygoyLrDZdrCX3gQiCK1qiPWvgxye29Tm1RpC4+pv+hAEkOnHA1Ad
	8EIgX2EwVrUSA71/1mg3DH8F4sFtEH/WhPOaUib0VWqnx6fZ8/SH2l/yoqjzj2ei3fw/BXl00uA
	90Z07vEzzTAJuPkv54ry0pCxI7zuoWv6uEyXLaRSjsFpHxaIQkteBcZHfzjF9O3VxyUN4wSjdxT
	RoAe/Veb0lMxZZFpe0lNsgfec/0VMf/j9M2CMC4RtKu5eHn/S+LeBUGrZoVI5UskGcA1ntbh+O9
	BGPR98U3g5AGj/XUjxr/dt77iqQLZtbCSd0blXT9e4MjOxqPg1cNJRtZ5CN+kDzQPBRnb/xmzbZ
	UQBeBesMwZDE47g==
X-Received: by 2002:a05:600c:674a:b0:4a1:fb23:68f0 with SMTP id 5b1f17b1804b1-4ac14ec788emr319488995e9.3.1793728201219;
        Tue, 03 Nov 2026 09:50:01 -0800 (PST)
Received: from localhost (p200300f65f19a9048e0e65dd41210f6d.dip0.t-ipconnect.de. [2003:f6:5f19:a904:8e0e:65dd:4121:f6d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e71b80333sm28497156f8f.32.2026.11.03.09.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:50:00 -0800 (PST)
Date: Tue, 3 Nov 2026 18:49:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <auod0uYPow76TEb8@monoceros>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
 <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
 <auoAZs66RA5OYjJo@p14s>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tqt42yzt45wmalce"
Content-Disposition: inline
In-Reply-To: <auoAZs66RA5OYjJo@p14s>


--tqt42yzt45wmalce
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
MIME-Version: 1.0

Hello Mathieu,

On Tue, Nov 03, 2026 at 09:40:22AM -0600, Mathieu Poirier wrote:
> On Tue, Oct 27, 2026 at 05:25:20PM +0100, Uwe Kleine-K=F6nig wrote:
> > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remot=
eproc/remoteproc_elf_loader.c
> > index da3cddbe7d4c..3c749a39e5da 100644
> > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > @@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, =
const struct firmware *fw)
> >  			break;
> >  		}
> > =20
> > -		/* grab the kernel address for this device address */
> > -		ptr =3D rproc_da_to_va(rproc, da, memsz, &is_iomem);
> > -		if (!ptr) {
> > -			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> > -				memsz);
> > -			ret =3D -EINVAL;
> > -			break;
> > -		}
> > +		if (rproc->ops->memcpy_tova) {
> > +			ret =3D rproc->ops->memcpy_tova(rproc, da, elf_data + offset, files=
z, memsz);
> > +			if (ret) {
> > +				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: =
%pe\n",
> > +					i, da, ERR_PTR(ret));
> > +				break;
> > +			}
>=20
> I really like your patch, but I'm wondering why you decided to move
> rproc_da_to_va() in ops->memcpy_tova().  Right now it is called in both p=
ath,
> i.e with and without ops->memcpy_tova().  Wouldn't it be better to
> unconditionally leave rproc_da_to_va() in rproc_elf_load_segments()?

The reason is that on ADI's SC846 the memory for the remote processor
isn't directly accessible by Linux. So there is no virtual address for
the given device address and thus the implementation of .memcpy_tova()
on that machine won't use rproc_da_to_va().=20

Best regards
Uwe

--tqt42yzt45wmalce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrqHsQACgkQj4D7WH0S
/k4sjAf/W9Wh/o2zfPqQyyyOgx0wwKDVNUCFZ3gnMmbmk4VZdCin6ZavZplg6T+x
coNDAgnxOftZnuWR1SpiFa6XCTmAE5ZxvNLbwzw6DF+G4Bq+z2ifELs9uZh/U0eo
HrJFd/MaHMCnZdw7Hr1emJPiegROrwq5psibMrjJItAbtrvyFUFKXQ+YKYY128Pi
8945jUEVVmAFRQ3nCV50qJW8+KPt36ZWnBRt8TjZHMMaHWuhLDuXsqUsCiYDkFnf
MeO9tFp+Aw2Nk78rkgmSg9kOauIt2+3ievOTOCN2haO43CYNx+In6f7GwLzSq2R2
Iffz8Diu7OmLg5+j4A7mG6jW7l/4RQ==
=MoF6
-----END PGP SIGNATURE-----

--tqt42yzt45wmalce--
