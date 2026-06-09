Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8092376A1A
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021509; cv=none; b=pDoHPc86E/wzLdg3Dv01eveDbN9HYoDbDcAA+fVsd8fxokJWXY0Ja13V3S93Awzx4eTp+goAJBBS509sIJjeJEb/V69YYdOG/z8kAfwTgncP6Nh3kQKZHILgiWPyAzsT3aOqqD1WLQzz5Tj2CZJFSgB0/ia+vX4Y8fxpOA82Ovk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021509; c=relaxed/simple;
	bh=00SS/Xzmmz5cOQhOWuM8lMZBCvPmsMinB6INBMN9QdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s30KLmiFQFWufBDc2jHKZJyKKaOxtzrUB6FmS5OCiXt1Pr3FEAIYBByKHGdPW+QEa3jUnhricHlGGghRznZMrbh8Z5OlKeb1bWhE6DsUvhpqmopCrSEtYm0WIJ5iHMRSSbiTmEj7pf0t1Zux/RPbdbEWMUVLC8BMJCiunEyCUSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CraomqsS; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CraomqsS"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf18c30bb2so41198625ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781021507; x=1781626307; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OtS0v5RJiVwlhfJHAeudQgGTHcf4Qlic2DpfgDHvJeg=;
        b=CraomqsSRvatQC+q3r5mncybj8+G7RtFk53Qg11tPeG+HtN9uNmVRCuzxlnbr32mXi
         TwnJvvIkqQyfTG8COX8G1GxRtsHiOHdX9FAdOd/q2k1E2y3+Un2rVNOJxIFNdRZ1qZsA
         VmQjhvFIwdVDie8jphIXpJsKbuWwpga9ZeoIv/KkWDMemiX8MEK9vh/cYcqCWszedIDs
         wENS2le7O8NpZRUZ/MbidV1/jZIXddIAnd9hWYSXEBPNamYNoc9piaPE2q4VMMB8vPh2
         PC+mdvXmulC4+lye+wp/S2bEw4eOLJ3Wak6ru3ibMnHRhteyUhVZa/akLoI85Dc/j9UU
         RNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021507; x=1781626307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OtS0v5RJiVwlhfJHAeudQgGTHcf4Qlic2DpfgDHvJeg=;
        b=JG0Fmt4xKnH6piCQ7XY+UZgmThVkrOw3EAxm9tjTr9KkW2khchmjxikRMPmI+SmMt1
         oXWaU/y7iHj8BBM2S1GDJcPkaM1lGg+V9ZB7K+YikjTUvne7angpcGy9qknKMJdlGM8L
         znRSzrorm4MLLa5oMQFTXjmpcZqWJcSNGBMdodqphjfSHeL5//ecd5J0dIIqK1H7uZS3
         yxpqvkshl2hA86VgZc2kSE3H85RUDw6ITcJcXKY/10FariBKZRYj7j8d4ITrA6vlVefR
         TdCIvqWRsOsOc07bOu346moYdPCv9Vdnl5AEf6PhA33REasgAg6GDteW0sMLajIssWAM
         CHbg==
X-Forwarded-Encrypted: i=1; AFNElJ+LuVCPRQZWvrMsZ8VeD7Eban7sZ9T/a5Cg8RBnI7DipWChHyBAUOYJfztjjQRqzuShaFROA4w9oIgSiLksGB3h@vger.kernel.org
X-Gm-Message-State: AOJu0YxNO7EnmRGy5Qqh6nCsImenQLHq+eRwKlrBR98zHiOZvKtWqpPQ
	lqhmAzouSALZQZ091lNp/LX2UqgSokj5eeMsBvPAg80lke1TyaOVE5GEDvrWkhtec+U=
X-Gm-Gg: Acq92OHGxkyVuTKQFaeYZLH+gc4j+5dZT95oGf6p8naS6aKAmG+UZNvKpRA50ge33IU
	D2Y7VQN8CVpmqyyH45y/56Nyc3ke004VXEKpUx4AQk2HRqypg+zoB9P390C5xuLwKCfilej0VGL
	PWBM9i2THa+FU0qCkKiD+KuTC+lOdXiw+5Iq2GrijG7WpghfQQQYXABKOfBhNjlWMJgCggWz8G7
	lpOzbKto5bkum0sQUvZLZ96m8hc1uct4CCAkqxosiEhgaO8om+93dphAnxcjHgGfvv9Sc+NFVvE
	jrJPmyEaipE0/Khgey8zq3rh4XVojiBYEdcCM4ZAsdJeqGuMFbcT2asE3CDa9jRiIXitQIBYhwK
	+X4rd3J+/3yXR8FcEoFuUbbwbBpC86IKoFYBR1atXDjgo5Z01eaKcWcGIXQ6ycZ3JQmtIvkO8w9
	vfv+Lpsn+F2p1sgar7iJT2sVLmashFFJgiVdOf
X-Received: by 2002:a17:903:1aef:b0:2c2:7e17:39f6 with SMTP id d9443c01a7336-2c27e173ecfmr105901915ad.36.1781021507165;
        Tue, 09 Jun 2026 09:11:47 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7f00:843c:9d87:e9dc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm294099785ad.17.2026.06.09.09.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:11:46 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:11:44 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, andersson@kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	divin.raj@arm.com
Subject: Re: [PATCH v3 4/4] samples: rpmsg: add MTU size info
Message-ID: <aig7QKcSIL1aVihQ@p14s>
References: <20260529164327.1827121-1-tanmay.shah@amd.com>
 <20260529164327.1827121-5-tanmay.shah@amd.com>
 <44c03148-9ff2-4fad-846d-ffe3d71adac1@foss.st.com>
 <e0660a16-d9e4-4988-8e58-d682d1712f51@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0660a16-d9e4-4988-8e58-d682d1712f51@amd.com>

On Thu, Jun 04, 2026 at 05:28:13PM -0500, Shah, Tanmay wrote:
> 
> 
> On 6/2/2026 3:34 AM, Arnaud POULIQUEN wrote:
> > 
> > 
> > On 5/29/26 18:43, Tanmay Shah wrote:
> >> RPMsg MTU size can be variable now and no longer hardcoded to 512 bytes.
> >> Add log to the sample driver that prints current MTU size of the rpmsg
> >> buffer.
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>
> >> Changes in v3:
> >>    - Check for error when retrieving MTU size
> >>    - %s/mtu/MTU/
> >>
> >>   samples/rpmsg/rpmsg_client_sample.c | 9 +++++++++
> >>   1 file changed, 9 insertions(+)
> >>
> >> diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/
> >> rpmsg_client_sample.c
> >> index ae5081662283..55afa53189af 100644
> >> --- a/samples/rpmsg/rpmsg_client_sample.c
> >> +++ b/samples/rpmsg/rpmsg_client_sample.c
> >> @@ -52,6 +52,7 @@ static int rpmsg_sample_probe(struct rpmsg_device
> >> *rpdev)
> >>   {
> >>       int ret;
> >>       struct instance_data *idata;
> >> +    ssize_t mtu;
> >>         dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
> >>                       rpdev->src, rpdev->dst);
> >> @@ -62,6 +63,14 @@ static int rpmsg_sample_probe(struct rpmsg_device
> >> *rpdev)
> >>         dev_set_drvdata(&rpdev->dev, idata);
> >>   +    mtu = rpmsg_get_mtu(rpdev->ept);
> >> +    if (mtu < 0) {
> >> +        dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
> >> +        return mtu;
> >> +    }
> >> +
> >> +    dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
> >> +
> > 
> > Do you really need this commit? rpmsg_send should return an error if the
> > buffer size is insufficient [1].
> > 
> > [1] https://elixir.bootlin.com/linux/v7.0.10/source/drivers/rpmsg/
> > virtio_rpmsg_bus.c#L517
> > 
> 
> Here, I just want to demonstrate rpmsg_get_mtu() API. Now we can have a
> configurable size of the RPMsg buffer. So rpmsg_get_mtu() API can be
> used to check correct buffer length before even using rpmsg_send() API.
> 
> I think I should check msg length against mtu size as well.

Do you plan on sending a new revision of this set or should I move forward with
this one?

> 
> 
> > Regards,
> > Arnaud
> > 
> >>       /* send a message to our remote processor */
> >>       ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
> >>       if (ret) {
> > 
> 
