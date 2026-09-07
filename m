Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C94F2F8EA3
	for <linux-remoteproc@vger.kernel.org>; Mon,  7 Sep 2026 22:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788819322; cv=none; b=uykB5m9CT143s7xovXlbEfEtJa4KEFjvgX3ieIncizfIW0/1R26c1UmJuquETZjQgLRv8CDIarVktOYSTeOCyel8l47eFdcDlisN81g/yaet8GdIwJs17xawZLhF6JL/pXTgYCX7du8Bn0Gmjqqp1F72snVa99Gm6KFGJUJ0zik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788819322; c=relaxed/simple;
	bh=xWQKezu4BREhy3j/blXwxCRCfvwvHIXrTtHnHeeaEXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jk+9zLsI2/mkQwV0DGlNotuJnLNLWaJkijMxwnv2j7DpMFfc5il7f5GwHr3bDosEOybsdyBy1XVC+IRArwzJwY4CCo93JNoC1L4EJX4Y8e5ekhY8PKUrvTAVFCGFRTCvDGPixrO4He0/fTSN35aSs7/wSgprAgvbHQ6QogyEqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJqnduyv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJqnduyv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48441a2ba14so3477935f8f.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Sep 2026 15:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788819318; x=1789424118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oxCw6MZUrUMQF3PxuLGYM79WzM4GNi956bvyl3WEJ2c=;
        b=rJqnduyv3+GKruEiOn2qVV1C7znyq5QrRRS8m9CUavzzgCz57d0/XAd8J+yUQrhg3O
         F0GCmdNrqMi7ytL99Rnq4dFDA58FMM9YfFX6s78vnx07rs0ylnylBPDT/qU8kkOBktKz
         yC8rRFqMDdP4lxGY3fvArsigYGjlylSkxKzCt3lVKDTLpWb2q9fCuZgzrZ2v9HAXXMpY
         RzL3zjzfevdli53ZcpxkIU6hS2QkZSuHgHOkt1YtMcnaty4fQzT2TwEBmQMAkVQ4etd9
         D1dXx3OwuRL5WVEuXzTf0xpLuI6Q6CGwc62QzAJzVWS3oY0n1RFIkjwDj+ij9CvKeAgv
         dl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788819318; x=1789424118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxCw6MZUrUMQF3PxuLGYM79WzM4GNi956bvyl3WEJ2c=;
        b=YYz6YKSJQrTlEDpj9ig/4nf18ZgvKj8YK7Apq0rpB/gXB6nwdQTNMMYGcUzj8WbGWh
         uCcVLgj4RIM/cI1OTHr6ndvy0aKWYuiGP6M5hB/TMn2g0kvTr//B3A29TbRqKMN5WfGt
         cIMCMaPpbl1HGbsW++xp13GHi5kq2EDFQl8fTLQJBQhTl3RBL6Qvy82TwQo314tFiHp5
         o6iaBz+JETwYVdr+uTjwQSe1MthLNy+y7UmTriuL2gO7VeyoFiAioZFJobf5qIQe7fZL
         8CBA6jPMK/8zLSV3Y/VgQmhWes8tJfTlpvgkFbrfEeaET3vR0AT1/T/V/JXMj3RTyYqB
         a3Kw==
X-Forwarded-Encrypted: i=1; AKwUvBy3jPnFD5dnbuZIJ/6XE3BZFX80oKNYXITZmNl2INKif9i8AB6HmqAYQt5DyaF4A+3d2jtEClGGAXQuDhD0YeAB@vger.kernel.org
X-Gm-Message-State: AFuF++ndcrZbcu7PZNX1mGAkBU5Qn8VRqt8/P097zK9wEjHHMVFsxAyD
	Wt7Ff76hmCZ4KnPhYsoB2AWGMOanQn4qRWuw7TDGqYeCoCh8+s98sFFk
X-Gm-Gg: AYBFou11Uo2149aDBf/ssLbaNvvqNhVZ0tHZnREdo7r1o9AK5ANcVHWs6tsXEC87b9Z
	cSFL6GRl+D5Wb9oJODxbsc0giXI5FyqKi/VfWjINJSpVR6RULkNoL1h2bBeKJ6TOVnS9UpM0pzE
	t+uiiXk3RSe5lVHM7+8d5qFmn/YKUFzJ3zrPwvh/450MFLELZ1cczg9/8a5UlXs6yjNPIDsbq6h
	fUsaqWXpG5Uj5eoEWVYVsNk1Dwomqw+t8hc8PQti3yK0Ig6lMWg/W0mrF+yIOoaWxPdh/KdNld1
	46vRjqebdTx3wUSBGS2puwY4RuJ+2/SK8rjvRKUah+mTcWxY62LsPzMQwQvuxk2lp7yt1WXIgE2
	1uL2crX1OQhdxuUjt0C0CPnIfsz/1yRsc4ZzcliQnDQ3rqhIksVfYJFef8hEZu7HRXDRDz5o578
	pn+CmreAbcD+mxfn8jlQ0/+BNnPnObZQb3pDQik0OlzEcTovt+xUgmseks5yxkK133CwAUi/FGZ
	gJvYbLWDzKNa+VWN+9UaUd3f5p3e6hYKSkisB5QtlQUkBmZOAkqBXkpYC+sGtGWdd8Xh6EXeVtM
	QHzJ0j1HGWzs1nBYXcNeuiHLDWXXkADwze3sacbwK++wwC6HFRNYIBJt5841qrZTr2IFGEYEDAB
	t
X-Received: by 2002:a05:600c:8012:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49cf826818dmr259779075e9.11.1788819318162;
        Mon, 07 Sep 2026 15:15:18 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-b0c9-3601-cdce-ba4b-d0e3-dede.310.pool.telefonica.de. [2a02:3100:b0c9:3601:cdce:ba4b:d0e3:dede])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm29993570f8f.8.2026.09.07.15.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:15:17 -0700 (PDT)
Date: Tue, 8 Sep 2026 00:15:14 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rusty Russell <rusty@rustcorp.com.au>, 
	Pawel Moll <pawel.moll@arm.com>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	virtualization@lists.linux.dev, linux-input@vger.kernel.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] virtio_input: stop callbacks before unregistering
 input device
Message-ID: <ap82pFlX8enNG0gZ@gmail.com>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
 <20260905152059.89560-3-kmehltretter@gmail.com>
 <20260907174559-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907174559-mutt-send-email-mst@kernel.org>

On Mon, Sep 07, 2026 at 05:46:07PM +0100, Michael S. Tsirkin wrote:
> > Assisted-by: LLM
> 
> which llm and which agent?
> 

Claude Code and OpenAI Codex, each with their current models.

I switch between them and let one do review, the other
helps with implementation.

"Assisted-by: LLM" is the form Documentation/process/coding-assistants.rst
gives now.

Thanks,
Karl
