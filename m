Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 8 Dec 2016 22:00:28 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus: fix channel creation
Message-ID: <20161209060028.GX30492@tuxbot>
References: <1480096493-7142-1-git-send-email-loic.pallardy@st.com>
 <20161202231944.GF9322@tuxbot>
 <2d614108-75ff-f6e8-8776-c6b2f6bbc629@st.com>
 <20161206174025.GE30492@tuxbot>
 <ae3b7df2-6fd0-1d48-0e37-bf56af7e637e@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae3b7df2-6fd0-1d48-0e37-bf56af7e637e@st.com>
To: loic pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 07 Dec 00:42 PST 2016, loic pallardy wrote:
> On 12/06/2016 06:40 PM, Bjorn Andersson wrote:
> >On Mon 05 Dec 00:32 PST 2016, loic pallardy wrote:
[..]
> >And as I said, we use the "id" when creating the device to match with
> >drivers, so I don't see how probing would work with it introduced.
> >
> Change has been introduce here:
> 4dffed5b3ac796bcaf040ca1f64e650f9263363e rpmsg: Name rpmsg devices based on
> channel id
> 
> -	dev_set_name(&rpdev->dev, "rpmsg%d", rpmsg_dev_index++);
> +	dev_set_name(&rpdev->dev, "%s:%s",
> +		     dev_name(dev->parent), rpdev->id.name);
> 

Ok, that makes much more sense.

> Before name was not explicit but unique.
> Now name is clear but not unique. If 2 identical services are announced on
> the same rpmsg link, second will failed.
> Instance number is needed to make it unique.

How about we just add rpdev->src and rpdev->dst in the name as well?

dev_set_name(&rpdev->dev, "%s.%d.%d.%s",
	     dev_name(dev->parent),
	     rpdev->src,
	     rpdev->dst,
	     rpdev->id.name);

As far as I can see this would be unique over all possible
configurations that we support.

Regards,
Bjorn
