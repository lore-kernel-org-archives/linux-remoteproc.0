Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0187FB64E
	for <linux-remoteproc@vger.kernel.org>; Sun, 21 Apr 2024 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713705383; cv=none; b=P8kMliHkkiCC6vDlUGCt/mnK8AP877H8yPKMvRzFm+WF2RADv4jOp06CrlAj8CRy8lh36EGZ/6hBPk0G2VKs7gPvt5IBLiwM4s0j6BQwaragS6oyz1HL4vb0oF3SbN1+o0knjn+4pR+fS/ofcrrPgZ67QxuKkLeAuJKqsvLImlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713705383; c=relaxed/simple;
	bh=a1fd6e6Gs1jt19mS2k5P5+/TYULLQJhNPZixk4mK/R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNjbCe7k/H9ybNDoawLbRvj8mXYY3auw4UPwmDCBW6fvRB8ylEBfqJktzd2QBZivQfKxhxpnRD5yVISV6lnfrTWkFPBExaPgVChw9D8NeWKZyil8KyRqzr4Ta8ZajkN4OVEhaayu/7egPjZJ40ZD+hIAjOJr7kMtQEuVonmCOhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p3ndwcCW; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p3ndwcCW"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-de462f3d992so3648017276.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 21 Apr 2024 06:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713705380; x=1714310180; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9b23fzJgHNWlYEQwRHhUtIVBTetbxKE4NVXPqvIaIrk=;
        b=p3ndwcCWHeJ/OJYWXoU6TdV3BiNFxxgDLO8i9HxkrRoTwzpsktAu6s61SndT/Rlhn4
         wiOwi2v6eYrLiUEJAy6jt2RmzlQn8HoG8THHzMVMob0oRcGQHjJlx1+FsJPXmuMMkTLe
         HV7SHL0fE9BTcCRvmTKQ0nUSK23wt2ddYEr5/vEHV9VepcDv/7ITGRy4cY2AqljYH1T/
         6cg9c0N5iFhDGMzmcsmqCOlE7n+KSGPa+8VpEpoH2ojq+j5VwZUVgZAu8YOtb9W1MCdO
         ZFj3uZTLy86AfxyENB6G3wkswsOq4IomI0ie6hCnrAf9HETajSFIDVhzDee8ZgLHF8fC
         db0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713705380; x=1714310180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9b23fzJgHNWlYEQwRHhUtIVBTetbxKE4NVXPqvIaIrk=;
        b=EOHCEdpFUiccwkEbE1HZzUBPmzKRF8akcUQ5mX1OgBPFcOehtLfVP8WYIiC5mSvfhQ
         9KwRp+iGpoOIeHs+Ud5zeIzUSFrR7ZS+pOsB1FtPvet6FT7EprZ8EDNTkc09UjCn+DRs
         YEbsJiIYYKEMVue+XzbRNsfp/GhlO9tR+b31dOm16UK51s3kUy4tCimPFONvVHufb1l8
         2ALYY3tlvfZgpcWTPnKFsB9nWRwIdIQtcbjIkOsV/bMdktm+laGdKKGEF+iD+MplbcJ5
         qGjNZeCaFVlsF4csCjbD8bXyMvjY+8EtaSgfKoyaatTWKqDlbck8SaDPfcBZB80DbIFq
         iD+g==
X-Forwarded-Encrypted: i=1; AJvYcCUW1rwrZCpt2FJ+Ux2ib3keIs6zcG4r7vtJQr7PtcR+NJLm59yQ3FzHKuQPXH1be1h0vfFRKuHg/HxiiQjCPxHc92C2cbyA/cIRCEjmk0Gekw==
X-Gm-Message-State: AOJu0Yyk35a2zLqqIkn39uwAIwHwLQ5xQcKcUTRta6pGAqNivfFFG/T7
	4Pvb+NmLuBdkQEP4CEGHjwuWl1BL5yeiqTR7Cc49ALSqj4dFXsiwehEXj/S32ztFQ93bD75s/JF
	TyiHP/dTKal8kQP4ubDjvUXHFemJVSIl90mO47w==
X-Google-Smtp-Source: AGHT+IHz7/ue+3qHJOx20G0EY6HjLKwRCFO+3MTk6f+JYhQyLzBF67jQE/qFXNu4AbkFXvkPTeDUIc/sANXq+e3DjYI=
X-Received: by 2002:a25:ae8b:0:b0:dcd:40fa:7bd0 with SMTP id
 b11-20020a25ae8b000000b00dcd40fa7bd0mr6131741ybj.3.1713705380035; Sun, 21 Apr
 2024 06:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
 <20240419-qcom-pd-mapper-v5-3-e35b6f847e99@linaro.org> <84a70058-38f2-4e76-b62e-b6c44e880f7b@nexus-software.ie>
In-Reply-To: <84a70058-38f2-4e76-b62e-b6c44e880f7b@nexus-software.ie>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 21 Apr 2024 16:16:09 +0300
Message-ID: <CAA8EJpoqs_cgqyosnHHZnsTkMepxRbpcWOQSKfT6zZJyVd2zDg@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] soc: qcom: pdr: extract PDR message marshalling data
To: "Bryan O'Donoghue" <pure.logic@nexus-software.ie>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 21 Apr 2024 at 02:42, Bryan O'Donoghue
<pure.logic@nexus-software.ie> wrote:
>
> On 19/04/2024 15:00, Dmitry Baryshkov wrote:
> > The in-kernel PD mapper is going to use same message structures as the
> > QCOM_PDR_HELPERS module. Extract message marshalling data to separate
> > module that can be used by both PDR helpers and by PD mapper.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> > @@ -0,0 +1,315 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 The Linux Foundation. All rights reserved.
> > + */
>
> Is this the right org attributed ? Definitely not the right year/years.

Yes, it is the right org & year. While the pdr_internal.h header (from
which these definitions were moved) didn't contain copyright, the
pdr_interface.c file was a part of the commit that brought the header
file in. The file contained this copyright header. Thus I assume the
most correct action is to use it for the new source file.

>
> Please fix, then.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>



-- 
With best wishes
Dmitry
