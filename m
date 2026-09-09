Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9B93BCD2C
	for <linux-remoteproc@vger.kernel.org>; Wed,  9 Sep 2026 09:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945613; cv=none; b=NKBmWLzQbzX2NyqM4simBoAviDISSbPUyIKMGRns6CE/blmN3RvlLISyiiYBg++tmRwpbNXMboAVJJ/ouO3gKIFvu92sybMwbubnDBpMv6apKGlSSsO5KBaU3bHwkcix6FiFj6vsc3/jOnmecvAX2ZFk4r6sPH9YHDEEPkVGn8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945613; c=relaxed/simple;
	bh=PdnZQvO3+oKJZgPjnG+zbfgcH9UOhnj7jaju9sYgC4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6FQ65+PnoCxHaAPkIJBSuwc2nW1io42BMVY82Hy+bfG1XI7VQ1tZGPHJ6ZtQdvtyQ3y+irSsnbcA2PD6jUQLgQal3tQBqGd3CrOu6qIdF8EOn06THyGDkETGpAYykXCOSdUUbKC1i0mCrQNjffpZ3YLzDYU7fJiDXwWfnaERvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iMWTsOYm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iMWTsOYm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso48609185e9.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Sep 2026 02:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788945606; x=1789550406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tEerm9pyUvgRnZ+v5dhjRTsyRhn0zUMJ8+Fd7BMxvcE=;
        b=iMWTsOYmB/Qh30BpKSrjQbq13s2Fmcdn7raP8fzbjdZHHuRf2kHk00dZwVy9b8J8eV
         2j18MHd3zy6Q7uLr0sNHJKNcWH68h/EcUCfB3FCNAmeAWd2KnFSTOZLxLvUODuUWSkEF
         DsWoRhboAB3pTKeFmEynnlN6W0npp6wrvMKOl70Pb1TzDFFsxsu2gwqE3nX85bntO7+g
         CqGUuagNq9dwV04DXP2bolKtuLurF5K+JUW6PfHVTtj93nfvMOGFayHHU/OH5FlvhDqZ
         LryJGAnWGay5nU4tbZP6dQIpz2VDlTT++pO56SlVnVS8WXmi3tixNy8RhZjs9SuN4gN+
         Yuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945606; x=1789550406;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEerm9pyUvgRnZ+v5dhjRTsyRhn0zUMJ8+Fd7BMxvcE=;
        b=mNxND7uJmhkYGbBOcgyzt/BwZxrp4K0w9wGwrHjVrUh75cQa4KyHiv66HmMR+V3FWx
         7nwvs93no2wg857zKZ+kwJ+KgUFB0Zz2PTw1UfD4P2ehSxglgliJfWdsE5qnMrBo6hId
         jviDS5giJP2QTXa9H3Pxr2vaJbBQ5Mua7nI6Ml/O2dNIIYlMifxColen0sogJTxP2Ahl
         iN9QH8vDEb+otl2DqK82f/FfLvNogP1bS1Ex7mh3Q0ae80wt6Szg5+AMn8h4wA8b/1LZ
         np77NiiwdP+c9aOb8UCofKFKiwvuyxXKKm0AXDl/YKiaCijUazeQGXWCbapZ0fJcNmUr
         hoCw==
X-Forwarded-Encrypted: i=1; AKwUvByTXrYeSYOcXDqecKScFI2zo8TwIxnaRpdyuyfxY6u4hFP6a7B4Mb0yVDFOKPoN9080F4MsX3mv906+56xT2c4f@vger.kernel.org
X-Gm-Message-State: AFuF++mThjfHFwKLMfSH52kj0jlgzGxYf0O6hhojnZH2m4qOmiQOBRX7
	31Rv722P+Eiv+xMremik0OekrIHgQH5P/UI44VknnjI0bHZK8f0jOIyLsZ3WNtWmiDQ=
X-Gm-Gg: AYBFou340ftTZn3r4QpUWE5LV7GjhW1xEiifVpYKmUQku3fWi/06tS7TkG/Z1/CmpaF
	VsXW+FBjf3yo93QlgIv+bEsOL8NfORB4I9vYX7K7eExyu4IdnK0LCsvj7XSLQQoKfIe0Cbu67gg
	nQ+39tC99Fj7fVjleLax7KMFymqaxOTKqxKJdrlWWfLpzEI0FFDVVkYwt4vqnTJP/r2CAMSCedL
	gfaQHdn2TA5L9Q4yYj6mCUFYCSBUiOhn+0hQwaGxKctN4VPqmIB3NADAinbBGqjdd+Xvy/5L9fO
	mZSABZGC9QRQ6d1d26utkFHaqPDOnFOVgiQBhOp9pEYEQ6hUruCsRguNlVlAc3eRS4RRCmsCsYg
	fwxTU+tNYpM5OfuEfkU1mscP9gTZC+EAfy8okMCF9ugr1ZYJ2M2Fj9mEigIeIFG8KmErQvUjiXk
	5o8NrW7UZfjGswpo5Cn1T61DbNupBOVjse/Wc+yIQa9qneGsHTL2UBDAr6FBYN5TRIKPu7DZ7aN
	Y1+
X-Received: by 2002:a05:600c:1914:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49cf8269fdfmr332845835e9.13.1788945605501;
        Wed, 09 Sep 2026 02:20:05 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49cfbdacc45sm430466665e9.11.2026.09.09.02.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:20:03 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:19:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Danilo Krummrich <dakr@kernel.org>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3] Documentation: Update after split of
 <linux/mod_devicetable.h>
Message-ID: <aqEWUBf1pewPP_K2@monoceros>
References: <20260908070031.32833-1-kmehltretter@gmail.com>
 <ap_HYy2IVZt-0mxN@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vttone5brkwdkpur"
Content-Disposition: inline
In-Reply-To: <ap_HYy2IVZt-0mxN@ashevche-desk.local>


--vttone5brkwdkpur
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] Documentation: Update after split of
 <linux/mod_devicetable.h>
MIME-Version: 1.0

Hello Andy,

On Tue, Sep 08, 2026 at 11:29:23AM +0300, Andy Shevchenko wrote:
> On Tue, Sep 08, 2026 at 09:00:31AM +0200, Karl Mehltretter wrote:
> > From: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@baylibre.co=
m>
> >=20
> > Most structs that were defined in <linux/mod_devicetable.h> before were
> > moved to a bus specific header. Follow the movement to get the struct's
> > documentation back.
> >=20
> > For the list of device ids in basics.rst use an explicit list of all the
> > headers that have kernel-doc annotations and that are not described
> > elsewhere (i.e. pci and mei_cl). <linux/device-id/acpi.h> is left out on
> > purpose, ACPI_DEVICE_CLASS() is not a device id struct.
>=20
> Huh?! The device-id/acpi.h provides the ACPI device ID definition.

<linux/device-id/acpi.h> provides both, struct acpi_device_id and the
macro ACPI_DEVICE_CLASS. The latter has a kdoc comment, the former
doesn't. So including <linux/device-id/acpi.h> in the patch makes
ACPI_DEVICE_CLASS appear in the list of device-id structs, but
acpi_device_id not.

So while this patch doesn't implement the optimum to get acpi_device_id
explicitly documented, but the purpose of the patch is to restore the
=66rom before ad428f5811bd, which is accomplished.

>=20
> > Also repair the referencing in the zh_CN translation of pci.rst and
> > don't duplicate `struct mei_cl_device_id`.
>=20
> > Fixes: ad428f5811bd ("mod_devicetable.h: Split into per subsystem heade=
rs")
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
>=20
> ...
>=20
> > Changes since v2
> >   https://lore.kernel.org/r/ede7ce64f20e10660ebf6bc1b41836dad750ae3b.17=
83349758.git.ukleinek@kernel.org/
> > - use the :file: role for the header path in pcmcia/driver.rst (Randy)
> > - say in the commit message that <linux/device-id/acpi.h> is left out on
> >   purpose (question raised by the Sashiko review)
>=20
> I am unsatisfied with how the ACPI division was handled in the above ment=
ioned
> split. Id est the include/device-id/acpi.h is *the* header that has to be=
 used
> for the IDs, not the respective "include all" linux/acpi.h.
> Hence the documentation has to allow the use of the device-id/*.h directl=
y in
> the drivers (most of the cases for ACPI).

I don't care much if drivers include <linux/device-id/acpi.h>
transitively via <linux/acpi.h> (or another header) or explicitly. My
preference is the former, but I won't argue if it's done differently.

> Alternatively the OF ID *and* ACPI ID must be included to the upper lever=
 bus
> headers. So, spi.h, i2c.h, platform_device.h and so on has to *always* pr=
ovide
> both.

That is the case today and it's sensible. So without giving a guarantee
for the next 20 years, I'd say keeping it as is is fine.
=20
> > - carried Randy's Reviewed-by and Tested-by from v2, the diff changed in
> >   one line of markup only
> > - Uwe asked me to take over the patch:
> >   https://lore.kernel.org/r/apv6yQ1U-HhNglyV@monoceros/
> >   It supersedes my PCI-only patch
> >   https://lore.kernel.org/r/20260905084916.40196-1-kmehltretter@gmail.c=
om/
> >=20
> > Randy's suggestion to add kernel-doc comments to <linux/mei_cl_bus.h> f=
or
> > struct mei_cl_driver and include those instead of the duplicated struct=
 is
> > left for a separate patch, it touches a header outside Documentation/.
>=20
> Uwe, can you fix that?

It's on my idle-todo-list. So unless someone beats me to it, I will
addresss that eventually.

Best regards
Uwe

--vttone5brkwdkpur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqhJLQACgkQj4D7WH0S
/k4CyggAtK1zDtK07mADDeDBynrhpncLSmcf8R0tSjv+Xk9TNGQ/6jg1KnpiwRJ8
H7gft1ZYewjr67sx4HJUqIAvhu9a6XSuVFFCJL0qpfdnLCV5HB41Sr774yWBmdgL
Ohg8uXSIiSxaWulydkjyqpAbMoO58YOFBqn9xH5ffXYsEGdjViQnISWry8jcojuO
We7CP3HzAH8W2U/7U/SjWHExzFUG2EDHty0IkIkhbbsw0WxSnjKwzwadG/u44t+3
kaCV6vKQ6pdYoUxazoWAU53UeLIg9QsXwcgEh5Jqyib7efudfyzAoMgK3I0PiQj8
I4Uq5TLA9bE+cMGACDmAQhLm4cmM0A==
=3eZW
-----END PGP SIGNATURE-----

--vttone5brkwdkpur--
