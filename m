Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0AD466AE6
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589209; cv=none; b=Quve5xc4PtUW/dy4JGT4TGryVXjAop31Fh3BPZDbMP6/FcYnglF1QR+X4a5hvOLnw/XZht80kayIykR4wtRZUmgHXZItGK+wuqRT0Y9sBNtPCFdJfGKxGjizEtHDlTpAuJwy1SDT8Kf5yOJieMdfKwzByWssD5J/1Pkmckavcio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589209; c=relaxed/simple;
	bh=PDQRMWW7Rcll+5kc+ejeeDKv6zoJD/yxOX9E1C8BeDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9XarFKInCHaWDJ8o2WC7HSyAYjasNy+utd3cnrIKEBwdo8Aa7UVY/70VlDwS5h2lh90wCHofuiN/HDQcetXRpHrB0KeRK69ZEK2G53sEytp8FY0GkkUXbcbjd2+ZRKOIWqojfEHqTB/x/gzw4T8AHx+83BtCM7kg8l80SThrUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IR/sYCAS; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IR/sYCAS"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc11a30a259so3840633a12.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787589207; x=1788194007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+QSibAn0UMx/gBIlWURwPsPXJu7ntnUEMY3GNgVUUE=;
        b=IR/sYCASbrAeVpfaGiNuWW/UlER1Y6f5cxQeL3CWYWqKgaDi4qRfnDESxe2edlcl5q
         OAeY2yDha6hDxruRyzWLYXIXZCPdoVndtZ5zmEjZMYwKtho/0qzKuc4mVRAU+hgzK3ga
         cdZ5+M8teIVzw7i941QRzOpFVXZYDeMBQf9nvvbki7HTpL6O5pkc0NMG0A/CITkDU4WN
         wIqtoOuWJFAeA/uJTfUhYUOLaXpz/SJq5kFIM7fHKYNqb5vz2C7BNfd167M+1nJ6fvqS
         UVkkn3p1/Us7Lw8ezKKWSd169pTeeDZ8+I2MDBZBCaqwiecPe2cL3o9PL+dhkpGzNw0f
         9dEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787589207; x=1788194007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+QSibAn0UMx/gBIlWURwPsPXJu7ntnUEMY3GNgVUUE=;
        b=H7FmX4WoLjTKJzSH1aVGkygZefJP1GEvMdu4l5MQgnSuStJXeOutIU2RyYyuXHtahb
         YBhaClRP8W//UP02dU97Vt3e+ivUQcejNYjUA0+kstge8F7VHo/YOD/nEjiZ8+Kf94e/
         Wqr84DsNJIGhJwfof3q6wEooozr7Mb6sW661ZLdtgbhEiFBmG1AIJjxTmxdrf2HFjF5D
         oBBTuDtzLQoY8RRJ5KxSEtQYarDLZFY+fyaEVgB1xsde+I24TN/epes0TPOjt+vz+2AK
         3l1xlMpl3LP4Roa/tMYczmnUQC1sbED8jLR0oVtG7X2bZgklaBw8EMs1UShlE6uwciHQ
         utKA==
X-Forwarded-Encrypted: i=1; AHgh+RrTGitlXZZiioIcZwtX4ERz38hp47C2pdujiFaanILpeVRNFLL8fXitsXmkuMMa6PUBmGXD9VeAQt+OKrsPHdgn@vger.kernel.org
X-Gm-Message-State: AFuF++mVX5BmkcZvH9BdYf9vO3gh0G5nesJn0cT6c+Y/vJHVUEGpOik5
	3M8+1d6/6NknDYxVXrU31sedJ77ZhxYwYyZK7db79jnd4B4CqJwuygkilcUVyzPYeJw=
X-Gm-Gg: AR+sD11S+0RNE7yr+y6c5t24OcN65GCevtKNwKze/UBlmLLg8vn25bvhRpSwUTMNokZ
	c3tAwREorsLPgFKT6CGu+Y62B7gpOSRM2V5cd/ja49+Zq0vsDrGzZz0Xtx/mzjrIkIvtDxmjosI
	jyTjnrncECjn/1anupr+tSF6gnVJJcPYlquv9f4+wR/25yuVhRSOKoYVLbErqTCyfxr3qYc3yiA
	OfyIzlSxnKHOSnsc/P9J9LealHb6/Qdecc+rZEtTasQWbDRagiDRB4hydEzTY6tmJ6nflkt5uC3
	u79CeVdxz1X8hbmV+4ZkPpdkI8EKZPkO+dpkMagPNyhIyUJmkYIJs+iIlI2plBMH5rhT1SChDGR
	OEA8vUg+R0RW+pG4Y9NrVIv1y0dVnJyPRjUb0bNSDTecjz+3CZNMuswMB16jI6uWKeuSLpNC6JM
	YDZIxn5vkTodWQlaYVOfTpEy9iW0LDr/dZx+EV9wa6rKyXfxChHCyD1Ce+zW9aiRHb
X-Received: by 2002:a17:90a:fc47:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-395df5e76b5mr38827905a91.16.1787589206702;
        Mon, 24 Aug 2026 09:33:26 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:82f2:24c5:571b:87b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d69065sm133297a91.13.2026.08.24.09.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:33:26 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:33:23 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/5] docs: rpmsg: add virtio config space details
Message-ID: <aoxyU4r9bH54zODJ@p14s>
References: <20260814044238.518296-1-tanmay.shah@amd.com>
 <20260814044238.518296-5-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814044238.518296-5-tanmay.shah@amd.com>

On Thu, Aug 13, 2026 at 09:42:37PM -0700, Tanmay Shah wrote:
> The virtio config space can provide single rpmsg buffer size in each
> direction. Document details of the configurable buffer size via virtio
> config space.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v6:
>   - rpmsg.rst: modify alignment related documentation
> 
> Changes in v5:
>   - fix documentation of buffer alignment
> 
>  Documentation/staging/rpmsg.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
> index 63612b7ee120..cabaf3d11ae7 100644
> --- a/Documentation/staging/rpmsg.rst
> +++ b/Documentation/staging/rpmsg.rst
> @@ -299,3 +299,20 @@ by the bus, and can then start sending messages to the remote service.
>  
>  The plan is also to add static creation of rpmsg channels via the virtio
>  config space, but it's not implemented yet.
> +
> +Configurable buffer sizes
> +=========================
> +
> +By default each rpmsg buffer is 512 bytes, and the same size is used for both
> +the receive and transmit directions. Remote processors that need a different
> +size (for example a larger MTU, or different RX and TX sizes) can advertise it

"... or differnt RX and TX queue sizes)...

> +through the virtio device config space by setting the VIRTIO_RPMSG_F_BUFSZ
> +feature bit.
> +
> +When this feature is negotiated, the driver reads struct virtio_rpmsg_config
> +from the config space. This structure provides the size of a single buffer for
> +each direction (TX and RX). The device should advertise TX/RX buffer sizes
> +that already satisfy its own alignment constraints.
> +
> +If the feature is not negotiated, the default 512-byte buffers are used for
> +both directions.
> -- 
> 2.43.0
> 
