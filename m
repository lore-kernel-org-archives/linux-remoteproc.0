Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C583C8DE
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Apr 2024 19:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713553351; cv=none; b=GlZmZHoyiM/xd8u/KDaA4VXSoVhNj2cvwcSYGLCy9FyLtv7QtG2vNW7sz7cQzhltMY4Kb5DbkaavpSLyYLty+GF07x9ClEtfwJpliWaAioK8DkMP59HvpsQQSyIN0gTCS5ju1qWIR+pp4zhilYVZykj/WhM9JHE0eaPVcdH5xMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713553351; c=relaxed/simple;
	bh=UhJcNRMs0vZ91LzrYCNDinJylgWKCou8J7y4IKDWYgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYtbx7xMDXE47SZCt/I+81fE+MDIeXEk0+A1DVHBOapM2J2gCQqeqKmQylkXFCFBjhdNHCdAr+sHCOSHTk1P9TzE2T2Ec1kGSof66s9wFkvYWqY0v4KdCKxJL2A36a3r7bCAuc5wCF5QVzaG9Ml16XObC1foShwvN1DK4RwEC5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dqFCnwbi; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dqFCnwbi"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc742543119so2585385276.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 19 Apr 2024 12:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713553348; x=1714158148; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MM/dgZHXt8FS6OlywG34mVoNeCOlBTkm9fbT/NynvQY=;
        b=dqFCnwbiRyIHk4gp4GG7j8mO1CiSG4sSt/ivn1t6C+amywA/okx08QqAFFXMHejPE6
         r1NvpgwDd3v7mruy6HSgogARNeE5e4Q7rEuMP8Q9JbOaqlTQUXLZV4KzQZmGH6OvYTF6
         /LQCkmTqP4MFaUD/xqeeVt3uYD63SEhJLEAdJvYhu1pvCzXX+g2PpRjmuKa7G3Wc2qX2
         ARlvfK+zW0lh76vAQk/09wBDBLsZ8DZ03r/ixWk3WggTvW8woHR1pb2xIr5KKBiLa6vR
         EogLG4Wjtpb/pXtXy8VpBjxcMlN5jELK2fpJFist05/RLKJPx0GFoa05cpJxnNYj72GW
         QraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713553348; x=1714158148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MM/dgZHXt8FS6OlywG34mVoNeCOlBTkm9fbT/NynvQY=;
        b=B2nXxvPM3EIVz3A5X+8mWeZvg7N8Gu+/aM7FT2V83Ms3SN1zJLAZvS4srZ/T50cNqf
         0H6eNMF+VcChKBLjSVzfFtt3WbmjTY76aD6YWoHfmiYniKqL8C6DVW+Rnf/Qvn6d6R62
         Vnr6aO7rMdEix6w3tV3S4BS/ox7K+N+d7RFPxlSiTF7hOkZXcvEBCXZHWS+5Fsh6zj54
         xZRZqGhS6wTbYHIl4W9ZBnS/GHOXiV/rOm+P7jGofzNekfd2gWXxovL59yna73EkXlzf
         4eRhrwcEUenJR3b5TbwL9OmpKdHMwGyoquavvk9NEsaxzSJb5zCkVJsRcqD6aab3aGjB
         otkg==
X-Forwarded-Encrypted: i=1; AJvYcCWukbmzStT1xOSrfwnehM8YAZ7temdtpuGVNewescLUsdL8gWRjQO7T85nibL2I57/w8gx89LJd+3DfxvJawXjCy3gK8PIB299TZwvh/4D7Xg==
X-Gm-Message-State: AOJu0YxVXnJQeNoQtS4QJYbFAnJdv1k5SWW2vMZeg+7zIMJ0M1XE4qfI
	QT0qeZo6XIyYAhipbjCZwPLjyjMn60T7h0RebtuT/zuRaW5jfgANKtN9M2V2Rmt3QzJQqDRO++u
	sOKp4Bhav5c4itOZA+RQMdJhUDYIN0bVu6j0wrQ==
X-Google-Smtp-Source: AGHT+IGYNvztQUdO273upIMXv4yi6iZHNs7ImfnmJnms8A12buCPUZGT0Vn926Qs8QF/zvzemXhWy27eQ6zHFvnA1oU=
X-Received: by 2002:a25:acdc:0:b0:dc7:4460:878a with SMTP id
 x28-20020a25acdc000000b00dc74460878amr3095289ybd.3.1713553348445; Fri, 19 Apr
 2024 12:02:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
 <20240419-qcom-pd-mapper-v5-5-e35b6f847e99@linaro.org> <b26b5d54-d04d-41e1-abe1-600633882989@kernel.org>
 <CAA8EJpoyTXWY5uxJs2gt1Rths-HdgskuQFyw5dJSL66mxQOv7g@mail.gmail.com>
 <67c90fcd-df2f-40e4-9507-dcc9340f2319@kernel.org> <CAA8EJprQzp+bmTa9CFoev_vk8Xf-H+ZAc-dFsqev76WOB6GtJQ@mail.gmail.com>
 <c255c9d5-f3fc-438c-abbe-64995823e80c@kernel.org>
In-Reply-To: <c255c9d5-f3fc-438c-abbe-64995823e80c@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Apr 2024 22:02:17 +0300
Message-ID: <CAA8EJpoyg1VXzQVU2BBScXXyxbZo+pV1AR52=GcrJ0Z3Sp8iVg@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] soc: qcom: add pd-mapper implementation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Xilin Wu <wuxilin123@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Apr 2024 at 21:45, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 19/04/2024 20:24, Dmitry Baryshkov wrote:
> >>>>> +};
> >>>>
> >>>> If this is supposed to be a module, then why no MODULE_DEVICE_TABLE?
> >>>
> >>> Ok, I should add this to the commit message.
> >>>
> >>> For now:
> >>>
> >>> This module is loaded automatically by the remoteproc drivers when
> >>
> >> Hm? How remoteproc loads this module?
> >
> > remoteproc drivers call qcom_pdm_start(). This brings in this module
> > via symbol deps.
>
> Ah, right, I understand now. So this should not be loaded on its own on
> the machine.
>
> >
> >>
> >>> necessary. It uses a root node to match a protection domains map for a
> >>> particular device.
> >>>
> >>>>
> >>>>> +
> >>>>> +static int qcom_pdm_start(void)
> >>>>> +{
> >>>>> +     const struct of_device_id *match;
> >>>>> +     const struct qcom_pdm_domain_data * const *domains;
> >>>>> +     struct device_node *root;
> >>>>> +     int ret, i;
> >>>>> +
> >>>>> +     pr_debug("PDM: starting service\n");
> >>>>
> >>>> Drop simple entry/exit debug messages.
> >>>
> >>> ack
> >>>
> >>>>
> >>>>> +
> >>>>> +     root = of_find_node_by_path("/");
> >>>>> +     if (!root)
> >>>>> +             return -ENODEV;
> >>>>> +
> >>>>> +     match = of_match_node(qcom_pdm_domains, root);
> >>>>> +     of_node_put(root);
> >>>>> +     if (!match) {
> >>>>> +             pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
> >>>>> +             return 0;
> >>>>> +     }
> >>>>> +
> >>>>> +     domains = match->data;
> >>>>
> >>>> All this is odd a bit. Why is this not a driver? You are open coding
> >>>> here of_device_get_match_data().
> >>>
> >>> Except that it matches the root node instead of matching a device.
> >>
> >> Yep, but if this was proper device then things get simpler, don't they?
> >
> > I don't think we are supposed to have devices for software things?
> > This is purely a software construct. It replaces userspace daemon for
> > the reason outlined in the cover letter, but other than that there is
> > no hardware entity. Not even a firmware entity to drive this thing.
>
> Firmware interfaces are also not "devices" but we create device drivers
> for them. The code lies in drivers, so it is a driver, even if somehow
> kernel software construct. fs/pstore/ram also has a driver, even though
> this is software device to handle ram dumps (it is not a driver for
> RAM). net/qrtr/smd.c is not even in the drivers and as well describes
> some sort of software daemon.
>
> If this was not a driver, then it would be a subsystem... but it is not
> a subsystem, right?

It is a server. Or a service. Compare this to nfs-kernel-server or
historical things like khttpd.

>
> >
> >>>>> +
> >>>>> +     if (!ret)
> >>>>> +             ++qcom_pdm_count;
> >>>>> +
> >>>>> +     mutex_unlock(&qcom_pdm_mutex);
> >>>>
> >>>> Looks like you implement refcnt manually...
> >>>
> >>> Yes... There is refcount_dec_and_mutex_lock(), but I found no
> >>> corresponding refcount_add_and_mutex_lock(). Maybe I'm
> >>> misunderstanding that framework.
> >>> I need to have a mutex after incrementing the lock from 0, so that the
> >>> driver can init QMI handlers.
> >>>
> >>>> Also, what happens if this module gets unloaded? How do you handle
> >>>> module dependencies? I don't see any device links. Bartosz won't be
> >>>> happy... We really need to stop adding more of
> >>>> old-style-buggy-never-unload-logic. At least for new code.
> >>>
> >>> Module dependencies are handled by the symbol dependencies.
> >>
> >> You mean build dependencies, not runtime load.
> >
> > No, I mean runtime load dependencies.
> >
> >>
> >>> Remoteproc module depends on this symbol. Once q6v5 remoteproc modules
> >>> are unloaded this module can be unloaded too.
> >>
> >> I am pretty sure you can unload this and get crashes.
> >
> > If for some reason somebody has called qcom_pdm_get() without
> > qcom_pdm_release(), then yes. To make it 100% safe, I can cleanup
> > actions to module_exit(), but for me it looks like an overkill.
>
> I'll come with some more concrete example if you are not convinced.

Sure, I might easily be missing something.

-- 
With best wishes
Dmitry
