Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7F929A9C8;
	Mon, 23 Feb 2026 15:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771860586; cv=none; b=b6OQ4U6uVc7l6OZlhYCKW/2shdDuTTM+coUAwl/AGq6uLOBRk2vJ3hDz5UHxbfbhUW6v0f3zTijLKEG1wu/8SjY7cq1/txan+D7+sPqMnOS3yyzk7qstdLX3ZdhpSSB+dfzy9fN8c+it1M1I0rS6jJG1ScHIx69+z1Lzw5az3vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771860586; c=relaxed/simple;
	bh=HBQfRjeQ43AwW7bFrn0A8vyL1xP9lpu1YDjXfbPrFkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXsqL3vpUVnn5E/gCWqZ6qwPVIfVsA7pZVGglIuqjH0t6OBFM54+1UYKmkX0ZXUJOFs7GtiDhqa5CS+l5UxoVm8DF06y+sauxnOjvQ1K1hl/uTg5wp/0gDyKsL+dvH7nr1AUskZHpEBAyWHUWCqgH9tXhiyOcE38/LtcXpgERqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NocW6qKv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NocW6qKv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559DEC116C6;
	Mon, 23 Feb 2026 15:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771860585;
	bh=HBQfRjeQ43AwW7bFrn0A8vyL1xP9lpu1YDjXfbPrFkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NocW6qKvIApn6IIxODELUGBFt5QvuGDznrW1p2btACQNMbL0x+cQjRQkufyuLGfHQ
	 LQSrb4UcRmIXk5gIlAhjfXzB/7Vn51KdEOHcL1yO0JR7TIAiELPC2uLdFbHaP/fC3v
	 pH7/+OUXr4NJOm2AuvRWy0jnmRmfuLW8QuvS4q37wDruc6zYthcdFRillhHCGXZFI5
	 /0v3SOFoI+YODvKd+6pOWGsj3bQO1yDcqIte0C5liRyHNcinXgObk68tFVef0+mM1m
	 QW4CtY5gg2aUSQpJx08bFE0ksgfZtTHrY/1QlY52/x4q5/8aVeUeWP/N0srAXvufHS
	 KAcnu4NX8qf6w==
Date: Mon, 23 Feb 2026 09:29:43 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: jassisinghbrar@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	tanmay.shah@amd.com, mathieu.poirier@linaro.org
Subject: Re: [PATCH] mailbox: add API to query available TX queue slots
Message-ID: <jo4kugxook5b6fl7ifh3nuznehotkyqwnrgwq3olank7cvzhmj@hj5ibm3bbsln>
References: <20260209234430.512492-1-jassisinghbrar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209234430.512492-1-jassisinghbrar@gmail.com>

On Mon, Feb 09, 2026 at 05:44:30PM -0600, jassisinghbrar@gmail.com wrote:
> From: Jassi Brar <jassisinghbrar@gmail.com>
> 
> Clients sometimes need to know whether the mailbox TX queue has room
> before posting a new message.

This is rather vague, could you be more specific?

> Rather than exposing internal queue state
> through a struct field, provide a proper accessor function that returns
> the number of available slots for a given channel.
> 
> This lets clients choose to back off when the queue is full instead of
> hitting the -ENOBUFS error path and the misleading "Try increasing
> MBOX_TX_QUEUE_LEN" warning.
> 

In the event that we're using the mailbox framework as a doorbell, I
presume that the queue is full of duplicate rings already - so backing
off it perfectly fine.

But in the case where the client actually uses the interface to convey
data, what is the expected way for the client to know when to make
another attempt?

Regards,
Bjorn

> Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
> ---
>  drivers/mailbox/mailbox.c      | 23 +++++++++++++++++++++++
>  include/linux/mailbox_client.h |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 2acc6ec229a4..22eb8f3213be 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -218,6 +218,29 @@ bool mbox_client_peek_data(struct mbox_chan *chan)
>  }
>  EXPORT_SYMBOL_GPL(mbox_client_peek_data);
>  
> +/**
> + * mbox_chan_tx_slots_available - Query the number of available TX queue slots.
> + * @chan: Mailbox channel to query.
> + *
> + * Clients may call this to check how many messages can be queued via
> + * mbox_send_message() before the channel's TX queue is full. This helps
> + * clients avoid the -ENOBUFS error without needing to increase
> + * MBOX_TX_QUEUE_LEN.
> + * This can be called from atomic context.
> + *
> + * Return: Number of available slots in the channel's TX queue.
> + */
> +unsigned int mbox_chan_tx_slots_available(struct mbox_chan *chan)
> +{
> +	unsigned int ret;
> +
> +	guard(spinlock_irqsave)(&chan->lock);
> +	ret = MBOX_TX_QUEUE_LEN - chan->msg_count;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(mbox_chan_tx_slots_available);
> +
>  /**
>   * mbox_send_message -	For client to submit a message to be
>   *				sent to the remote.
> diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
> index c6eea9afb943..e5997120f45c 100644
> --- a/include/linux/mailbox_client.h
> +++ b/include/linux/mailbox_client.h
> @@ -45,6 +45,7 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg);
>  int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
>  void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
>  bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
> +unsigned int mbox_chan_tx_slots_available(struct mbox_chan *chan); /* atomic */
>  void mbox_free_channel(struct mbox_chan *chan); /* may sleep */
>  
>  #endif /* __MAILBOX_CLIENT_H */
> -- 
> 2.43.0
> 
