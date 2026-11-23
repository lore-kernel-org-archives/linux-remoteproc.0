Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795456489;
	b=1ItcJVggPGN15tfQ47gZBKaslBTpADQg2dvkRAnAm1L526hH0LMjTfcb6SfC/lCurQxB
	 RVepsp5tWj5RrRa+PlFk8SEwgCdAqrtH3swH1hmIFi9Bw0RrZrLYLWLfLepGPro9UUJ+Q
	 F59ahtO0uooPHgRtG34G2HK4jSaYTsHblywZ7LrwzOwZxTO0A1EQU7vSUM0gw9lYkkelU
	 KE/jXVtOly/YkfieDAIMtZN1OdSbWMnKwBd5LMxNdl8edYKJLQ+7zyzNzhjTzYpk5+LHl
	 Ap2xqTDx1YEKyu2Ck8w+XWT8BiC9IZz76e1a3R6wCg/TQETGXYEq0wY6yvKNl+xcDog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456489;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Correlation-ID:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:
	 X-Source-Args:X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:
	 AntiSpam-DLSP:AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:
	 CFBL-Feedback-ID;
	bh=hsHYRS9OInffpGq5oiUzbknaI7qM/TYlqpXmRUYxTj0=;
	b=YTLtR50DaNvB6lmAYeJ/yuY+GDMbisqagZJTWJ4cH71TxLcRk1pdNNJfc2CgQrUmdOaT
	 JdUCP9SWnQz6mrLJ1tsQj1c0Nq2ymKIh9PJ7k/60GwQcNNUW7wVE8Jk7JTU4e/h1yMlO7
	 KtkmXqq9mtlh4zT2Eh5gzsFVT/JdFtTk0XbpU/kDcUucNdTRZsqtghYYu3p+7SVskUsnf
	 +jraBCkhf7jSOp9M3EgFsezhTP5D2u0GWndHthCozTI6HdGWgGzQlXUwwbeSj3FvMGux1
	 Q+5Dv6VPr3tQr8f481hv/aDqHq7JMtT7hMYJjXptB7VmjmVSI6yev6WU2qSGTUACRYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Hcqg+rtC;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=abC0vOow;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.4
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7F6606A31A;
	Mon, 23 Nov 2026 17:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A7F6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Hcqg+rtC;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=abC0vOow
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com; s=arckey; t=1795456487;
	 b=YkxXisX8xqvr/aj6i0eS8W87R5x22gC9/jKmDp7VAuW7U+pTPMPHlYwpvnFz7iG0sdmlp8aDef
	  7xwMUjkDOEPVO/PSArEAgaD1Xz39VUEKXNt0RrulYRfOyud9ePnGVZSfZ8Py36VftFL06ZIyLf
	  8QNgyn7MDXd1R0OBAz9uTSWpntAmvbyHT6MRWqPRD/tA9Mxrkms+zaB6aHWiM6eLe+kXwUsgRC
	  mnXYXVkcEQRwQvBA4BT5Zeanx3WjZsD8ZOer3sd+Yo9GadtuIQ4HoJDvB4cyemF+JPieg/DcKp
	  pdbKgsrRYUfkVfVGnVJYs84FuxcjeiJ91HVbfzltcTh/6w==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com; s=arckey; t=1795456487;
	bh=hsHYRS9OInffpGq5oiUzbknaI7qM/TYlqpXmRUYxTj0=;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	  In-Reply-To:Message-ID:Cc:To:From:Date:DKIM-Signature:DKIM-Signature;
	b=ePUwX89EZds4xc8EFWRDypuxGTsQJMkedWV2quJROpgr3RDQOlFDdbTX69qATYGt68+v397JKB
	  7lHlInTD3yS+pFIQyE44c6tSfslJvrzbfbhC0ZmkCAyEeNKUtp7MpcrZ/lJRlUdpuyVKNcCpSp
	  Cu+4Qs6FE/2RebQWYp+3Exfq2/+YdO502AZv9e2BjnzuNnzSGvdvyiKKJOXwNHIeHz9mDjE6mz
	  c+XJhcUEq+FPOyJOf4ucfyNBraSIPxPRMVa4bprukpiKo6haw+S1sv7hMiBoqr+V0YZF2pjtWC
	  MOyxp9kpkxtabYFTspmL3u0iIUwzMfYAGv2x+Vd9d8/G+w==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Message-ID:Cc:To
	:From:Date:Reply-To:List-Unsubscribe;
	bh=hsHYRS9OInffpGq5oiUzbknaI7qM/TYlqpXmRUYxTj0=; b=Hcqg+rtC0eoLrhGa0CkAp9DAaa
	+sXaHHHLomz2M7HZbmBR/LEOAB0WSh1EFFX1KvGFrg7Yq/Ujp/n6p87cEe+TahEAlQ5wZTl2LtSis
	KJ8j4ddzfzb7Fykn0N61zdsQBpxtlKQVT5rrf/U3ZQCSW43Vn1ZdmxaMDxIGqg8jmE0g=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xVYFU-00000008AWF-0C2G;
	Mon, 23 Nov 2026 17:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=hsHYRS9OInffpGq5oiUzbknaI7qM/TYlqpXmRUYxTj0=; b=abC0vOow+Y9kNK3I2iSY1udxsr
	xN6eFBjDut49jNx+dlWMJpl23X/I+cTMfsLv6yFpGTy+H+zR2yuG2JhoEHOtuzqQkD/9L9UlrJkai
	kYWwUxD0dVNs30OdakX+87l3PgDLx9xf6l4797602jNVJAgKI5/pEFQSQ7gMKLgvgg7M=;
Received: from [79.28.115.6] (port=60568 helo=dummy.faircode.eu)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xVYFL-000000001L1-0AuF;
	Mon, 23 Nov 2026 17:54:31 +0000
Date: Mon, 23 Nov 2026 18:54:27 +0100
From: Francesco Valla <francesco@valla.it>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	openamp-rp@lists.openampproject.org,
	Bjorn Andersson <andersson@kernel.org>,
	Tanmay Shah <tanmay.shah@amd.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Message-ID: <78b33a86-6637-47e3-8987-853076e6183b@valla.it>
In-Reply-To: <1ad4d213-9494-4a46-8f4e-39efe8c8fa6c@foss.st.com>
References: <20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it> <au4QVFyk7Zzc6y2u@p14s> <av8V18TntRP2U6hQ@p14s> <4c542301-a80d-4f14-8651-1307ac783794@foss.st.com> <awDI4B8yYDB6h3H9@bywater> <1ad4d213-9494-4a46-8f4e-39efe8c8fa6c@foss.st.com>
Subject: Re: [PATCH] virtio_rpmsg: fix config space alignment
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <78b33a86-6637-47e3-8987-853076e6183b@valla.it>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 2df38b731ae5c6e2a03bcb6d98b2c158
X-AntiAbuse: ID - 2df38b731ae5c6e2a03bcb6d98b2c158
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xVYFU-00000008AWF-0C2G-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello Arnaud,

23 Nov 2026 09:12:41 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>:

> Hello Francesco,
>
> On 11/20/26 23:29, Francesco Valla wrote:
>> Hello Arnaud,
>> On Fri, Nov 20, 2026 at 06:50:47PM +0100, Arnaud POULIQUEN wrote:
>>> Hello,
>>>
>>> Sorry it goes out of my radar.
>>>
>>> On 11/19/26 16:29, Mathieu Poirier wrote:
>>>> [Adding openAMP mailing list]
>>>>
>>>> Heads up OpenAMP people, I will merge this patch in a week.
>>>>
>>>> Thanks,
>>>> Mathieu
>>>>
>>>> On Fri, Nov 06, 2026 at 11:37:24AM -0600, Mathieu Poirier wrote:
>>>>> On Sun, Nov 01, 2026 at 02:54:03PM +0100, Francesco Valla wrote:
>>>>>> The comment for virtio_rpmsg_config says that this structure is
>>>>>> naturally aligned to 32 bits, and this is desirable by some
>>>>>> architectures that don't get along with unaligned accesses.
>>>>>> The content of the structure itself however isn't aligned, and the
>>>>>> __packed attribute prevent the compiler to add this alignment.
>>>>>>
>>>>>> Fix this by adding a padding byte.
>>>>>>
>>>>>> Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from =
config space")
>>>>>> Signed-off-by: Francesco Valla <francesco@valla.it>
>>>>>> ---
>>>>>> Hello,
>>>>>>
>>>>>> unfortunately I missed this when the original patch set was sent, bu=
t I
>>>>>> think it's worth fixing (or at least discussing) this now before it
>>>>>> enters a stable kernel.
>>>>>>
>>>>>> The same support in open-amp has already been merged [1], but maybe =
it
>>>>>> can be fixed before the next release there too?
>>>>>>
>>>>>> Another, lower-impact solution would be to fix the comment, but that=
 can
>>>>>> then led to issues on architectures that does not support unaligned
>>>>>> accesses (e.g.: AMR Cortex-M0).
>>>>>>
>>>>>
>>>>> Thanks for bringing this to my attention.=C2=A0 I agree with this pat=
ch.=C2=A0 I will give
>>>>> Arnaud a couple of weeks to reply to this email though.
>>>>>> Thank you
>>>>>>
>>>>>> Francesco
>>>>>>
>>>>>> [1] https://github.com/OpenAMP/open-amp/commit/744376f566c3ec7e06a7d=
093d785295b78aa486f
>>>>>> ---
>>>>>> =C2=A0=C2=A0 include/linux/rpmsg/virtio_rpmsg.h | 2 ++
>>>>>> =C2=A0=C2=A0 1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpms=
g/virtio_rpmsg.h
>>>>>> index 0872cbca4593..d24fedb63023 100644
>>>>>> --- a/include/linux/rpmsg/virtio_rpmsg.h
>>>>>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>>>>>> @@ -23,6 +23,7 @@
>>>>>> =C2=A0=C2=A0=C2=A0 *
>>>>>> =C2=A0=C2=A0=C2=A0 * @version: version of this structure, currently =
%RPMSG_VDEV_CONFIG_V1.
>>>>>> =C2=A0=C2=A0=C2=A0 * @size:=C2=A0=C2=A0=C2=A0 size of this structure=
 in bytes.
>>>>>> + * @reserved:=C2=A0 padding, reserved for future usage.
>>>>>> =C2=A0=C2=A0=C2=A0 * @txbuf_size:=C2=A0 Tx buf size from remote's vi=
ew. For Linux this is rx buf size.
>>>>>> =C2=A0=C2=A0=C2=A0 * @rxbuf_size:=C2=A0 Rx buf size from remote's vi=
ew. For Linux this is tx buf size.
>>>>>> =C2=A0=C2=A0=C2=A0 *
>>>>>> @@ -33,6 +34,7 @@
>>>>>> =C2=A0=C2=A0 struct virtio_rpmsg_config {
>>>>>> =C2=A0=C2=A0=C2=A0 u8 version;
>>>>>> =C2=A0=C2=A0=C2=A0 __virtio16 size;
>>>>>> +=C2=A0=C2=A0 u8 reserved;
>>>>>> =C2=A0=C2=A0=C2=A0 /* The tx/rx individual buffer size (if VIRTIO_RP=
MSG_F_BUFSZ) */
>>>>>> =C2=A0=C2=A0=C2=A0 __virtio32 txbuf_size;
>>>>>> =C2=A0=C2=A0=C2=A0 __virtio32 rxbuf_size;
>>>
>>>
>>> What about using a u16 for the version instead?
>>> Even if we never use the MSB of the field, it seems cleaner to me than
>>> adding a reserved field.
>>> Indeed, we can consider the config space header as containing the
>>> version and the size. The rest is version-dependent, including the
>>> reserved part.
>>>
>> Between the two options, I prefer the u16 version, to keep the
>> version-dependent "payload" aligned to 32 bits. I'll send a V2 with this
>> modification.
>> Shall I send also the corresponding modification for open-amp, or you'll
>> take care of that?
>
>
> As you want, I have already sent a fix related to this structure in open-=
amp [1],
> so I can also add this update if/when it is applied by Mathieu
>
> [1] https://github.com/OpenAMP/open-amp/pull/714
>

Then I'll leave it to you, it's way more efficient.

> Thanks,
> Arnaud
>


Thank you!

Regards,
Francesco
