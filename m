Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA455455607;
	Sat, 10 Oct 2026 11:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631540; cv=none; b=DfEHEZP5koNoSgcTXKGIBq8cBUHoV4d4z7AuxxFyRaU5voE1iykq9DBDjBh34kicxynDr5NFHtwuhVJhpa/XG00jVj6+Tmr97g3SuHPM7hoQetNIkhuy3DUw16PEEtLzQpA90XLIGJMAcC9gXpSTuGdhSF5zaVHKQ4fc5cGWF7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631540; c=relaxed/simple;
	bh=YzqLPw7XgcjHjtBA3K7qVaKgKH+F5SwiMXFMpixd7WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyMU6GDkgIej78WKbwQmUU6Oy4T5mt1S0Uw1GOFRjoqHtAfBAMGEmO5uvTYoGfTRlJVx4IfCEmztgQf+7/Ne5DlDASsmTs0h54MJrrqoQGZnBPGj8W/wHy5FpYf0bhG80sLOGEoJx/BKAq0Flt8jTjhje+T/6mDMtLEVGwGCAVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkWDQV81; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkWDQV81"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 534C41F000FF;
	Sat, 10 Oct 2026 11:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791631534;
	bh=sfY+uRPXEdWtjLqcJybNaXUFUCXdQfre4GQZmBn9q+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EkWDQV81ES1DiWJ9wSkZqMiad1XbLcb+RmAxG+yGosD++Z9VE7utgqi/C0E6ywBAb
	 4catZUSGzeCgoVPyQxCr6pCW8wEivmFgEFnU035MinLtih4EeRS3rhtEHLj8r7GnUc
	 om7VFblNFyKl6KXVPSi7bnEDwAESnVlGDHzQ0hMipKXbGPcC1Y36uU7lleuYL8q6ch
	 WjNs05xmUrZLhGxQCDsigiACvl1BEyM6Ld0FCd8LPxOeyCAfHioObUjaTlpk0ODQ/5
	 1rZYzzexcGr+N53mcDK0zUSwYpc4X/nEUhaLuMAhpJhLrzh4rbOpaKwFLesIriJ6Po
	 c1a0Y2R5sJ2Yw==
Date: Sat, 10 Oct 2026 16:55:28 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, andersson@kernel.org,
	mathieu.poirier@linaro.org, konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: pass no resource table when the
 firmware has none
Message-ID: <asogqMMvsGTTmHr1@sumit-xelite>
Mail-Followup-To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
	andersson@kernel.org, mathieu.poirier@linaro.org,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
 <20261005161224.umj6zzov57tifv7v@hu-mojha-hyd.qualcomm.com>
 <asQQJNOd_p9acgT1@RAMIREZO.na.qualcomm.com>
 <20261006100344.piyiffp6rwvt3w2s@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261006100344.piyiffp6rwvt3w2s@hu-mojha-hyd.qualcomm.com>

Hey Mukesh,

On Tue, 06 Oct 2026 at 15:33:44 +0530, Mukesh Ojha wrote:
>On Mon, Oct 05, 2026 at 11:01:24PM +0200, Jorge Ramirez wrote:
>> On 05/10/26 21:42:24, Mukesh Ojha wrote:
>> > On Mon, Oct 05, 2026 at 02:54:00PM +0200, Jorge Ramirez-Ortiz wrote:
>> > > The firmware resource table is passed to the PAS backend even when the
>> > > firmware carries none. This only works on the first boot, while the
>> > > cached pointer and its size are both zero.
>> > >
>> > > Stopping the remote processor, or failing to start it, frees the cached
>> > > table and clears the pointer but leaves the size set. The next start
>> > > then pairs a NULL table with a non-zero size.
>> > >
>> > > The SCM backend substitutes an empty table and hides the problem. The
>> > > TEE backend copies from the NULL pointer:
>> > >
>> > >   remoteproc remoteproc2: powering up cdsp
>> > >   pc : __pi_memcpy_generic+0x110/0x22c
>> > >   lr : qcom_pas_tee_get_rsc_table+0xf4/0x25c
>> > >   Call trace:
>> > >    __pi_memcpy_generic+0x110/0x22c (P)
>> > >    qcom_pas_get_rsc_table+0x38/0x60
>> > >    qcom_pas_parse_firmware+0xa0/0x100
>> > >    rproc_boot+0x2d4/0x380
>> > >    state_store+0x40/0x100
>> > >
>> > > Fixes: a4584bff63c8 ("remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call")
>> > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>> > > ---
>> > >  drivers/remoteproc/qcom_q6v5_pas.c | 11 ++++++-----
>> > >  1 file changed, 6 insertions(+), 5 deletions(-)
>> > >
>> > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> > > index a005546c265d..e871e03ba794 100644
>> > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> > > @@ -463,7 +463,7 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
>> > >  	struct resource_table *table = NULL;
>> > >  	size_t output_rt_size;
>> > >  	void *output_rt;
>> > > -	size_t table_sz;
>> > > +	size_t table_sz = 0;
>> > >  	int ret;
>> > >
>> > >  	ret = qcom_register_dump_segments(rproc, fw);
>> > > @@ -476,11 +476,12 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
>> > >  		return 0;
>> > >
>> > >  	ret = rproc_elf_load_rsc_table(rproc, fw);
>> > > -	if (ret)
>> > > +	if (ret) {
>> > >  		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
>> > > -
>> > > -	table = rproc->table_ptr;
>> > > -	table_sz = rproc->table_sz;
>> > > +	} else {
>> > > +		table = rproc->table_ptr;
>> > > +		table_sz = rproc->table_sz;
>> > > +	}
>> >
>> >
>> > Earlier code was intentional please read the comment below.. /**...*/
>> >
>>
>> AFAICS the comments say that the call might pass NULL and zero as input
>> resources. And this patch does exactly that - it doesnt allow NULL and
>> non-zero.
>>
>> did I miss something?
>
>No, you did not miss anything.. I just wanted to highlight that I
>did not keep else statement in my initial implementation
>intentionally and relied table_ptr and size will be NULL on
>failure of rproc_elf_load_rsc_table()..

Looks like you still haven't understood the problem this patch is trying
to solve. It's the PIL restart sequence where the table_ptr is NULL and
size being passed as non-zero which is incorrect from caller point of
view.

The backend will surely error out in this case. On a restart you again
have to pass the table_ptr as NULL with size as 0 to fetch the resource
table again. Surely we don't want the backend to hide errors on client
part here.

-Sumit
