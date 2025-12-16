Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D373557EA
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765897980; cv=none; b=aftwiKSBgOiqlfwg0UZt+spVCU9+ni7L+dVIYHC23eDqQi7nPna2g0JzLRykyTVRpcn8nXvQke2dYg4dUyr4TK7esllHTY8MhWCcR72lxcc2poIxd3eiPGQkeG8+yYoV/1713hKXQ8vM6Mzi8Moke8MFR9H7J4dhBzvSjaRk33o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765897980; c=relaxed/simple;
	bh=otRnitXgK3YK8QOOnOlDhlnw9uTpljPxLSfkYiE4/jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T65+xA8e3hkK279EnMDlGs4pExl6eRt/AqkUTiySIHkhAICWPfCQP1HAICIXVmxH4e21tbWdJC1/kC0ElqrwteTDchsLarpMx/wLwh4cTJxeqdWbzuRBiY8jCr/SbePjEHF0zqaYSrxImzih6HoNJqG1Uc4NF0EYrjpu0McAgto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ak6pimUM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ak6pimUM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so33786275e9.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 07:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765897976; x=1766502776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2RaB9SM+pvwUf1QmqN2DN92hZRXQJ2LlXiPVs66C+PM=;
        b=ak6pimUMaCZZ/eH5zmilk5fKWiWmW54oMRx2jPSJVi1CVmJPC98gQhTksBJFW+6nHP
         DLE/wPy/UVd/TBJCpnXSaDfkC28opZO1OGWlzr6THu7BZffJesytfKxKrfaEWWQOvJdB
         Ro9a3MGnc9Th9Aofq0LHrc4iXCjQxD7lXbdtME75auAIp06AwNFJk17U4gcy4sEeP6BZ
         iRvSkXX1cwVC/goq2Jw4EZ9m/Ie8IaH/U2IsFtT/U51CKl+hcFy8uf0/8tp07WkrieUV
         1JAlv/ia8ggNysCdeLTYF/v1MLare0gRW8hYTq3ZcLxz/6Or+4EXMTge1Q2fGGhNLp8K
         cYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765897976; x=1766502776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RaB9SM+pvwUf1QmqN2DN92hZRXQJ2LlXiPVs66C+PM=;
        b=gzCYOsy83aKglRW2ua4pn8rG6Q1MjEyfG7sLtVBOJ2Sop/aek9s0KyryqPxb1FQNoy
         2FPF6xCoaQBE+i8kh265mVufhy3kprOnH7jcs5yF+l26/je9e+EWkGWXWwJPh10zo/T5
         wwR5SMTETjsntgsKcthwU0WNHdtqrOuUuGLkDCgWFpg4MNLQnUCwpwtDv0R+6eoIc977
         KJQOGRd9yNvMTWvXW5F8wnMdRpveUb/hXB6S25QBaII75Hft+oaPSU4YMvmT0xxDnRX4
         xlrctBpYCDnLz0uF7QkKlFCFNY9tWB6M+LwmIJ6uj+eRv5XzdqZ1pXOuaA7QwKnGBjts
         0p9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUbWW2qYupNcPufgX0D0oKSslbNOMu009pOPJ4RwGkC2EPus4fPtbrkIhklf0WcZciIgYhhzMSOAqxIqcc1/EG@vger.kernel.org
X-Gm-Message-State: AOJu0YzdrUY9LN7Uiru6Jo6i5uAfkvaexcUzpHg85FBRAi/0l/ltdwex
	WQQKkXP4FccH5YV85WDd/QNNIRZovTWIqGm8tp98NU7M5+I/JU3n73ZuGrzU8CmZor4=
X-Gm-Gg: AY/fxX4Vl4T+g31Gj7QqQFAqTZIh1Izh27QcxFbWnGpQKUoNej3cqF2bxrOcS5IzOnO
	Wvs4hRLWSFh5JVf5JHErT+BtvcvkxZIfOnxOZzWOdujtZQaQ+dUwCE0TkT+7j58//fOlFk+0FTH
	OXVbSKBfjxlw3RusO10AhY5R3Vy4TSYC5p+aSJaVJsFy0YW9TlhCCvyXjVz18tO/038QJ+a8hgM
	xo04MGfTutfum5q83PSJDO6/jySk0iAN6of0MwftNQtGPaLSxYY7nCPJwpb3pDTDe7xsokSISbk
	0nZ5XUpNXN6cJK/biDBhVDRKuwcwHaFOctNcQhwcQHk7rqf1l9GnWYtQ1XE50IXOlJh/GSH7X9l
	U1IreBNJvHnmYrfov4ABJU9MdvCWrO6ki/yiRZd3jI9KYYVvsFT6HGqvDuWzHTyLb1CM9TvcfYg
	i2kQoOFeUr7M/smw==
X-Google-Smtp-Source: AGHT+IFg1h+oSthyGc4tPORkNrPPpnVeUr6FNMPfEJgnXBupogksrkrfKGsIU7DtuK9+emJLDR1CpQ==
X-Received: by 2002:a05:600c:608d:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-47a8f8c18d1mr142495795e9.11.1765897975942;
        Tue, 16 Dec 2025 07:12:55 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd90b81e6sm12034075e9.3.2025.12.16.07.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:12:55 -0800 (PST)
Date: Tue, 16 Dec 2025 16:12:52 +0100
From: Petr Mladek <pmladek@suse.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
	rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
	mhocko@suse.com, tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, jonechou@google.com,
	rostedt@goodmis.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
Subject: Re: [PATCH 21/26] printk: Register information into meminspect
Message-ID: <aUF29MLUj3YRh4v_@pathway.suse.cz>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-22-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119154427.1033475-22-eugen.hristev@linaro.org>

On Wed 2025-11-19 17:44:22, Eugen Hristev wrote:
> Annotate vital static information into meminspect:
>  - prb_descs
>  - prb_infos
>  - prb
>  - prb_data
>  - printk_rb_static
>  - printk_rb_dynamic
> 
> Information on these variables is stored into inspection table.
> 
> Register dynamic information into meminspect:
>  - new_descs
>  - new_infos
>  - new_log_buf
> This information is being allocated as a memblock, so call
> memblock_mark_inspect to mark the block accordingly.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>

I haven't tested this. But it looks reasonable from my POV.
I assume that the output from the "log" command was from your
synthetic test so that "crash" was even able to print the messages.

Feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I haven't attended Plumbers conference this year so
    I do not know what is the current state of this project.
    
