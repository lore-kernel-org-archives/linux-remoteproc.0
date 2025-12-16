Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8A92DF130
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 22:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765925119; cv=none; b=VBaLl8TBs5D8gQZnh4weE9YEGtICrzd2lI+x+hCNUvJ5nH1KqA44kRkQG359zDMO3F2vK0rYDsCz6XuPPhQIfWNXT908LytV2fBvYfB6ckv1hDe7wtrICOxATY1l1h6Kro1F2Pq6WDjbGRxncZdTxZGKYz5ImoIE/ueJEu1HniI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765925119; c=relaxed/simple;
	bh=3NEQ5V9RhdJFlg/bSRdDII08BAgyJYCFrsNJhWAbvGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRUCBzNDEnEnfINswKSvKeGjQI3jc6SaGGueuW5UrSGeaVQ+kNiSR8oQUlmgxWLZQzkHjCn3dEBMDwsGS7aYhv7tqGXROe48/0YtcvcpSY4c8iXlcuVzGxtuH/6bWzNFNkhROOtOUNfVzqL1Gggj+quZBFLLCxWvGfdgm89YexM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LiHsyrvL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LiHsyrvL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0d6f647e2so44666575ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 14:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765925116; x=1766529916; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AR1JGVCrYOq5uwCMMI70hgFcm+ktjWSWnpXwIlRejaE=;
        b=LiHsyrvLKpsMOBJYKqP8FyKmSUimoSKQUqlhFTA4X4ET4O8KDXt4VRdr+8TX9LTF96
         WXzedgREoFXUp6fP4sYm2LFuIdnUhKQDMUkKO3R4NfBoe0HkUlUd8+OHZi2O3mutTCgU
         xOmt8LNF/GpDHjvtUMERsEM7MtRkrDqEKAR5e7YZIpdnLuimzT26U+ng6tGLu5SsDrdx
         t7GIZVqL/HuqccKhTRE3VMSRBxc8DpW7wJuQWbgST0v1iYhlhQxd9YtD/AlVjWGA57Uq
         lZ7xJrt9JNW5CuINBrTMkxGy+vZqU4fIqy64FftdrYYTRE8aJWU1ydc8++wd80zX0yIk
         NhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765925116; x=1766529916;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AR1JGVCrYOq5uwCMMI70hgFcm+ktjWSWnpXwIlRejaE=;
        b=UxnmqJyfvXOwSA5uNzan24SL3kmTj3+guvcrcju+LnWfgin+P/1MgjpvL1KKwWXDiK
         aXmox98jEckWk7CyVmZQwC/TwWzBTCUSRh0aOQvz5+g2a3xR+wBtrPm+jCgas2b8qW9M
         ANv+Apg0y6C8ApDDWTMUe6xcDgNu7DhKw9tq1hEXXlAlHYxThVD3J9Kwv6rOARJm3i+6
         jiijosz/5NXZ6jp9/VINgIATyFGCXHH5dIXaU7EH3lWCbjJ8mFHPqfi0SHKZqAiS+5mr
         LKj+uxr+2uz6Mjjc31Ne7tNZ1wh3QR+8/TNJm8BbQJ9hz/PtRLi/ncreZcifZyPMASr5
         0Jjw==
X-Forwarded-Encrypted: i=1; AJvYcCXyyxLNZSK2eTedDcYJShXTl+c/TWTQra/GhFrDWQKSScm09fC7EctgWKk/Gj2P4ESq+E50EAGHelgjJpyNlYRh@vger.kernel.org
X-Gm-Message-State: AOJu0YxcfxUCx3S2ZPWoCt732lQy+VloYaucv5L32daD/qoGx7gzkdMD
	7GRnvd3nE/7y/dnPMIZ02J8QFcr4gNX/3IDWk51kCi1D55/J0MPRHveyQmVTotnBD5w=
X-Gm-Gg: AY/fxX4bFyOy8ebhAqAEwgApd0pwtYddC+sGklUK3MW6PRf2e7BG5k6vHCi1VGHQ5Ky
	R9QZloUYaylLL/ctelb1joT57BL0l6/YG1unEVvHVtHzYtrWvWLdnvg9Bw5z6EcZTP+SddAXBNJ
	PHGChgX1orTVpu8Rru+r6Z63ACl0EBSgan4BnDcvPivyBb77iu5wUiYRW0Dtj2eEiL7GMgnp5t3
	uBfzOxEts+aBKsvpXeyessDdtAxgVU6OStv1bpJcStHPOJFhczHlFGrWgQAdVzcnSTlXGXnruUx
	7TLWgKMzHGl3PLBvZ3uSOoBN5QCtAmuzodNnnXAv1azVytaTZMQ8Iwc6qRvCcQoky4+71ZUHNJ9
	gOobuDbCQUdju7IVaWxRSUzoUb6PvIMTeptIGRbbqEx0P6lnT9lkVKwSNfEKgZP4yN+J3EkMRqu
	6CgHPYm7Sx30YxPA==
X-Google-Smtp-Source: AGHT+IHlf022sKmg9PvWm1g6x5qCleg7CGbhTD0sTz9lR3tqhWCn1Hso1Ql/qQ0jJj968JLmuQBbrw==
X-Received: by 2002:a17:902:f9c3:b0:295:96bc:8699 with SMTP id d9443c01a7336-29f23b53ef6mr108947955ad.20.1765925116256;
        Tue, 16 Dec 2025 14:45:16 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ba5d:91e2:900a:fb01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea03fa7bsm179137035ad.68.2025.12.16.14.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 14:45:15 -0800 (PST)
Date: Tue, 16 Dec 2025 15:45:13 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, andersson@kernel.org,
	jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, virtualization@lists.linux.dev,
	xiaoxiang@xiaomi.com, Xiang Xiao <xiaoxiang781216@gmail.com>,
	arnaud.pouliquen@foss.st.com
Subject: Re: [RFC PATCH 2/2] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
Message-ID: <aUHg-bN90ZPyZk0W@p14s>
References: <20251114184640.3020427-1-tanmay.shah@amd.com>
 <20251114184640.3020427-3-tanmay.shah@amd.com>
 <11280877-95f0-4361-9112-23bb17372e91@oss.qualcomm.com>
 <c5395ebf-b0ea-4be8-b0c0-6a51d4c98e09@amd.com>
 <20251203142540-mutt-send-email-mst@kernel.org>
 <d858a46d-e5cc-4d87-b5b5-8130dfd42145@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d858a46d-e5cc-4d87-b5b5-8130dfd42145@amd.com>

On Thu, Dec 04, 2025 at 10:55:10AM -0600, Tanmay Shah wrote:
> 
> 
> On 12/3/25 1:35 PM, Michael S. Tsirkin wrote:
> > On Wed, Dec 03, 2025 at 12:12:46PM -0600, Tanmay Shah wrote:
> > > Hello,
> > > 
> > > Thanks for your reviews. Please find the response below.
> > > 
> > > On 11/22/25 6:05 AM, Zhongqiu Han wrote:
> > > > On 11/15/2025 2:46 AM, Tanmay Shah wrote:
> > > > > From: Xiang Xiao <xiaoxiang781216@gmail.com>
> > > > > 
> 
> [...]
> 
> > > 
> > > Thanks, that's a good question. I keept id 2 unmodified from the original
> > > series. I don't know why ID 2 was chosen in the original series. I will have
> > > to discuss this with the linux remoteproc/rpmsg maintainers and choose the
> > > correct ID.
> > > 
> > > I don't see any problem choosing ID 1, but for some reason if ID 1 was
> > > assigned and deprecated (I don't think that is the case) then only we should
> > > use ID 2.
> > > 
> > > 
> > > Arnaud, Mathieu, Bjorn any input here?
> > > 
> > > > > +
> > > > > +struct virtio_rpmsg_config {
> > > > > +    /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
> > > > > +    __u32 txbuf_size;
> > > > > +    __u32 rxbuf_size;
> > > > > +    __u32 reserved[14]; /* Reserve for the future use */
> > > > 
> > > > Should we use __virtio32 instead of __u32 to avoid endianness issues?
> > > > 
> > > > 
> > > 
> > > Sure, if that is the standard in other virtio headers I will modify it.
> > > 
> > > Thanks,
> > > Tanmay
> > 
> > rpmsg is still not standardized, sadly. It's really time it was.
> > 
> > 
> > 
> > Modern virtio devices use __le32.
> > Accordingly, accessed with virtio_cread_le
> > 
> > 
> > __virtioXX and virtio_cread are for legacy compatible parts of config space.
> > 
> 
> As of now, I am using virtio_cread so I think it is legacy compatible.
> 
> > 
> > Does rpmsg want to be modern or keep using legacy? I donnu.
> > 
> 
> I don't know either. This we have to discuss with the maintainers and other
> vendors.
>

I would certainly like to see a modernization effort, but it needs to be
backward compatible.  Probably outside the scope of this set though.
 
> 
> > Ideally it should finally be documented and at that point we
> > definitely will want to switch to __le32.
> > 
> > 
> > For now, run sparse to make sure you don't introduce new endian-ness
> > issues.
> 
> Ack.
> 
> > 
> > 
> 
> 
> 
> > > > > +    /* Put the customize config here */
> > > > > +} __attribute__((packed));
> > > > > +
> > > > > +#endif /* _LINUX_VIRTIO_RPMSG_H */
> > > > 
> > > > 
> > 
> 
