Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85E04E1C9
	for <linux-remoteproc@vger.kernel.org>; Thu, 28 Mar 2024 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711636738; cv=none; b=mbbnYwNbDXlKEJbxN2Af1lQelDt3FRYCDsn86C3UAnecKAM965gAECkXnMrBuiJE8ezooH6u5nr4hV694Df1gWzgswCpcqgliZW3/h+d6ZGzyd1oKjUd7O6klTHpioQms+fMiHsmPWpCHhkpVib15gDE7HbW0Eb3msmr8UPr7Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711636738; c=relaxed/simple;
	bh=xVj5HRDyXjXywf0BrqhT5YR5lLz9+FQIXUJqKdaQyvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haonZHtOey8672guY64S6Bu4/pukZ7TkS6bmgY2O8EbEXJUGDUEJtuPqcyup8kTbsjiQoQyPih0wqgjplPGZaDEizjLa/b7lIhxvFGQqE5sPk+YeJbhFEeLctmJ3NrTUkwBL9DieX31xie3X/eG4HMAoyZ/ZM2Hnvahb7mC5vHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XVFvDtJv; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XVFvDtJv"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e703e0e5deso908258b3a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Mar 2024 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711636736; x=1712241536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vMY8NVnOF97MA9cY4uKJK6Z1YfV/geMkbCzYeBNB1p0=;
        b=XVFvDtJv1rGW8RgtpHJqm7D/W79K8kB+Ows0fla089cINuEmOWBletLi6QU7swDVLM
         OJUJhCrienLMcvbmJghhqoRYTe6gMfgiKSLHv95BkagqaQrl+vsSO8QUukuoSDHguTAo
         sKdjNpI9ybEtDL1qgFPrea8F527+Ic1ORVoGb6ypF1QwqIDKM/5Z9d6d21ZZIEugVHUI
         +WXIDyC3fnLmxQuGv5r+XUMYYAOkulZeR5YYZvUx6bs7IRNlccbtncY+1AHXwGTAi5md
         CitLc+AzczgSBiRv0AmEvKtlzLtx0xyotIW9g6IvH/z0usT3xpwKKb2gD8KGBM+lF4MZ
         /YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711636736; x=1712241536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMY8NVnOF97MA9cY4uKJK6Z1YfV/geMkbCzYeBNB1p0=;
        b=NgHPnZFtkOdyFi0S1ADBgLXNOztoIQyQocqeU+GI64mm5QtCELKgWflqrCyB0hCQaZ
         H7wrsnGRnAldblr36uEHJNVi1n3E4yedIGYXtc4GyP2d0J3kO3LJi56Of1+N9Uyh2PP+
         cV+bu2Z6i8epcP2eQQgdDPFrKbHlN19xY6xyYHJH9bVNJ87GEHkymq+4OklqWzXjIW+/
         AJj7SRkvItDb0Ec8g1Pakpuw2WtJ3Jqjz0ALSohTVrRgkBzs18qkWjf36AU6BvFFOXxj
         SByVmCv1RyUzLCFwMIB7R0h49GA+nempk13dKQRyv1Felig/IDq9W938sCqUqearwTe/
         CKQw==
X-Forwarded-Encrypted: i=1; AJvYcCWQURD2tBbJb4Rt6qrhXq6HNwgqbIV0X90/2i65zDFOdTh2a474h3im9HucAXQvahIl964Yn32mnua4yeZtqcTGgWengA65UZs/2rMlEMdF9w==
X-Gm-Message-State: AOJu0YwS2fgQbnQPQkyMyFtCbrq9F+ziyk+egNZA42xZOsC8Sz0jVC3f
	od8tne51gLqKqaUos6BfQT41Xi6dkB3j0oCRN3kxtlrEenWQMu0fKPkmbMA4IbA=
X-Google-Smtp-Source: AGHT+IHSRHXvmH5VZNmwCTDuXN846Z1hCir5wFWdCEOx0hNfK6aMIMOd1COe/h7RuCB3uRw7DmjA6g==
X-Received: by 2002:a05:6a00:464f:b0:6ea:7b29:3ab7 with SMTP id kp15-20020a056a00464f00b006ea7b293ab7mr3081643pfb.23.1711636736154;
        Thu, 28 Mar 2024 07:38:56 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff63:c57b:4625:b68c])
        by smtp.gmail.com with ESMTPSA id p43-20020a056a0026eb00b006e6b12d650asm1439220pfw.31.2024.03.28.07.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 07:38:55 -0700 (PDT)
Date: Thu, 28 Mar 2024 08:38:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: andersson@kernel.org, matthias.bgg@gmail.com, tzungbi@kernel.org,
	tinghan.shen@mediatek.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org,
	kernel@collabora.com
Subject: Re: [PATCH 2/2] remoteproc: mediatek: Don't parse extraneous
 subnodes for multi-core
Message-ID: <ZgWA/E46i/CaoM74@p14s>
References: <20240321084614.45253-1-angelogioacchino.delregno@collabora.com>
 <20240321084614.45253-3-angelogioacchino.delregno@collabora.com>
 <ZfxRyMyUqyqtXy8n@p14s>
 <9ef4e974-740e-4698-bb38-f236521a425c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ef4e974-740e-4698-bb38-f236521a425c@collabora.com>

On Wed, Mar 27, 2024 at 01:49:58PM +0100, AngeloGioacchino Del Regno wrote:
> Il 21/03/24 16:27, Mathieu Poirier ha scritto:
> > On Thu, Mar 21, 2024 at 09:46:14AM +0100, AngeloGioacchino Del Regno wrote:
> > > When probing multi-core SCP, this driver is parsing all sub-nodes of
> > > the scp-cluster node, but one of those could be not an actual SCP core
> > > and that would make the entire SCP cluster to fail probing for no good
> > > reason.
> > > 
> > > To fix that, in scp_add_multi_core() treat a subnode as a SCP Core by
> > > parsing only available subnodes having compatible "mediatek,scp-core".
> > > 
> > > Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/remoteproc/mtk_scp.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > > index 67518291a8ad..fbe1c232dae7 100644
> > > --- a/drivers/remoteproc/mtk_scp.c
> > > +++ b/drivers/remoteproc/mtk_scp.c
> > > @@ -1096,6 +1096,9 @@ static int scp_add_multi_core(struct platform_device *pdev,
> > >   	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
> > >   	for_each_available_child_of_node(np, child) {
> > > +		if (!of_device_is_compatible(child, "mediatek,scp-core"))
> > > +			continue;
> > > +
> > 
> > Interesting - what else gets stashed under the remote processor node?  I don't
> > see anything specified in the bindings.
> > 
> 
> Sorry for the late reply - well, in this precise moment in time, upstream,
> nothing yet.
> 
> I have noticed this while debugging some lockups and wanted to move the scp_adsp
> clock controller node as child of the SCP node (as some of those clocks are located
> *into the SCP's CFG register space*, and it's correct for that to be a child as one
> of those do depend on the SCP being up - and I'll spare you the rest) and noticed
> the unexpected behavior, as the SCP driver was treating those as an SCP core.
> 
> There was no kernel panic, but the SCP would fail probing.
> 
> This is anyway a missed requirement ... for platforms that want *both* two SCP
> cores *and* the AudioDSP, as that'd at least be two nodes with the same iostart
> (scp@1072000, clock-controller@1072000), other than the reasons I explained some
> lines back.
> 
> ...and that's why this commit was sent :-)
>

Please update the bindings with the extra clock requirement in your next
revision. 

> P.S.: The reason why platforms don't crash without the scp_adsp clock controller
>       as a child of SCP is that the bootloader is actually doing basic init for
>       the SCP, hence the block is powered on when booting ;-)
> 
> Cheers,
> Angelo
> 
> > Thanks,
> > Mathieu
> > 
> > >   		if (!cluster_of_data[core_id]) {
> > >   			ret = -EINVAL;
> > >   			dev_err(dev, "Not support core %d\n", core_id);
> > > -- 
> > > 2.44.0
> > > 
> 
> 
