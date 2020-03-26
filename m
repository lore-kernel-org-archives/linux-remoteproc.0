Return-Path: <jslaby@suse.cz>
Subject: Re: [PATCH v7 2/2] tty: add rpmsg driver
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-3-arnaud.pouliquen@st.com>
 <e458f805-c746-c88e-98f4-d874a7552933@suse.cz>
 <1e4ce821-dd9b-bb04-774b-58a255834cf5@st.com>
 <ec061c30-eace-1df9-fa7b-71a61e5710a2@suse.cz>
 <2512639d-424f-9647-4dbd-3b3459465888@st.com>
From: Jiri Slaby <jslaby@suse.cz>
Message-ID: <3e666fa0-2f4d-9958-887e-8830049ccbe8@suse.cz>
Date: Thu, 26 Mar 2020 12:45:57 +0100
MIME-Version: 1.0
In-Reply-To: <2512639d-424f-9647-4dbd-3b3459465888@st.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-stm32@st-md-mailman.stormreply.com, xiang xiao <xiaoxiang781216@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 26. 03. 20, 12:40, Arnaud POULIQUEN wrote:
>>>>> +	/*
>>>>> +	 * Try to send the message to remote processor, if failed return 0 as
>>>>> +	 * no data sent
>>>>> +	 */
>>>>> +	ret = rpmsg_trysendto(cport->d_ept, tmpbuf, msg_size, cport->data_dst);
>>>>
>>>> data of rpmsg_trysendto is not const. OK, you seem you need to change
>>>> that first, I see no blocker for that.
>>>
>>> I created a temporary buffer to ensure that buffer to sent does not exceed the 
>>> MTU size.
>>> But perhaps this is an useless protection as the rpmsg_tty_write_room already
>>> return the MTU value, and so the 'len' variable can not be higher that value
>>> returned by the write_room?
>>
>> You still can limit it by msg_size without cloning the buffer, right?
> you are right, but in this case i need to cast the buff to suppress compilation
> warning on const and I don't know if all compilers will accept this...
>  
> pbuf = (u8 *)buf;
> ret = rpmsg_trysendto(cport->d_ept, pbuf, msg_size, cport->data_dst);

No, don't do that. Read my first message again; in particular:

> data of rpmsg_trysendto is not const. OK, you seem you need to change
> that first, I see no blocker for that.

thanks,
-- 
js
suse labs
